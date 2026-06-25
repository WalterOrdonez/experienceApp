import 'dart:developer' as developer;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_prototype/features/login/data/models/user_model.dart';
import 'package:flutter_prototype/features/login/data/models/user_password_model.dart';

import 'login_datasource.dart';

class FirebaseLoginDatasource implements LoginDatasource {
  final FirebaseAuth _auth;
  FirebaseLoginDatasource({FirebaseAuth? auth})
    : _auth = auth ?? FirebaseAuth.instance {
    _logInitStatus();
  }

  void _logInitStatus() {
    try {
      final currentUser = _auth.currentUser;
      developer.log(
        'FirebaseAuth initialized. Current user: ${currentUser?.uid ?? 'none'}',
        name: 'login.datasource.init',
      );
    } catch (e) {
      developer.log(
        'FirebaseAuth init check failed: $e',
        name: 'login.datasource.init',
        error: e,
        level: 1000,
      );
    }
  }

  @override
  Future<UserModel> login({
    required UserPasswordModel userPasswordModel,
  }) async {
    final startTime = DateTime.now();
    final maskedEmail = _maskEmail(userPasswordModel.email);
    developer.log(
      'Starting Firebase login request for $maskedEmail.',
      name: 'login.datasource',
    );

    try {
      developer.log(
        'Calling signInWithEmailAndPassword...',
        name: 'login.datasource.pre-request',
      );

      final credentials = await _auth.signInWithEmailAndPassword(
        email: userPasswordModel.email,
        password: userPasswordModel.password,
      );

      final durationMs = DateTime.now().difference(startTime).inMilliseconds;
      final user = credentials.user;
      if (user == null) {
        developer.log(
          'Firebase login returned null user after ${durationMs}ms.',
          name: 'login.datasource',
          level: 1000,
        );
        throw FirebaseAuthException(
          code: 'null-user',
          message: 'No se pudo recuperar el usuario autenticado.',
        );
      }

      developer.log(
        'Firebase login succeeded for uid ${user.uid} after ${durationMs}ms.',
        name: 'login.datasource',
      );

      return _mapFirebaseUser(user);
    } on FirebaseAuthException catch (error, stackTrace) {
      final durationMs = DateTime.now().difference(startTime).inMilliseconds;
      final errorDetails = _analyzeFirebaseError(error, durationMs);
      developer.log(
        'Firebase login failed [${error.code}] after ${durationMs}ms:\n'
        'Message: ${error.message}\n'
        '$errorDetails',
        name: 'login.datasource',
        error: error,
        stackTrace: stackTrace,
        level: 1000,
      );
      rethrow;
    } catch (error, stackTrace) {
      final durationMs = DateTime.now().difference(startTime).inMilliseconds;
      developer.log(
        'Unexpected error during Firebase login after ${durationMs}ms: $error\n'
        'Error type: ${error.runtimeType}',
        name: 'login.datasource',
        error: error,
        stackTrace: stackTrace,
        level: 1000,
      );
      rethrow;
    }
  }

  String _analyzeFirebaseError(FirebaseAuthException error, int durationMs) {
    final code = error.code;
    final message = error.message ?? '';

    if (code == 'network-request-failed') {
      // Fast failure (<1s) = connectivity issue, not timeout
      if (durationMs < 1000) {
        return '''Network: Fast failure (${durationMs}ms) suggests:
  • DNS resolution failed
  • Server refused connection
  • Firewall/proxy blocking
  • Invalid Firebase project/region
  • No internet connection
Message: $message''';
      } else if (durationMs > 30000) {
        return 'Network: Timeout (${durationMs}ms > 30s). Check internet speed.';
      } else if (message.contains('Connection refused')) {
        return 'Network: Connection refused by server (${durationMs}ms).';
      } else if (message.contains('Unreachable')) {
        return 'Network: Host unreachable (${durationMs}ms).';
      } else if (message.contains('Interrupted')) {
        return 'Network: Connection interrupted (${durationMs}ms).';
      } else {
        return 'Network: Error after ${durationMs}ms. Message: $message';
      }
    }

    return 'Code: $code, Duration: ${durationMs}ms';
  }

  @override
  Future<bool> isLogged() {
    return _auth.currentUser != null ? Future.value(true) : Future.value(false);
  }

  @override
  Future<bool> logout() {
    return _auth.signOut().then((value) => true);
  }

  UserModel _mapFirebaseUser(User user) {
    return UserModel(
      email: user.email ?? '',
      id: user.uid.hashCode,
      username: user.displayName ?? '',
      firstName: '',
      lastName: '',
      gender: '',
      image: user.photoURL ?? '',
      accessToken: '',
      newId: user.uid,
    );
  }

  String _maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2 || parts.first.isEmpty) {
      return 'invalid-email-format';
    }

    final localPart = parts.first;
    final visiblePrefix = localPart.length <= 2
        ? localPart[0]
        : localPart.substring(0, 2);
    return '$visiblePrefix***@${parts.last}';
  }
}
