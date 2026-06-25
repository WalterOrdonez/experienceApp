import 'dart:developer' as developer;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_prototype/features/login/data/datasources/login_firebase_datasource.dart';
import 'package:flutter_prototype/features/login/data/models/user_password_model.dart';
import 'package:flutter_prototype/features/login/data/repositories/login_repository_impl.dart';
import 'package:flutter_prototype/features/login/domain/usecases/is_user_logged.dart';
import 'package:flutter_prototype/features/login/domain/usecases/login_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login_state.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final LoginUser _loginUser;
  final IsUserLogged _isUserLogged;

  LoginNotifier(this._loginUser, this._isUserLogged)
    : super(const LoginState()) {
    checkSession();
  }

  void setEmail(String value) {
    state = state.copyWith(email: value, errorMessage: null);
  }

  void setPassword(String value) {
    state = state.copyWith(password: value, errorMessage: null);
  }

  void toggleObscurePassword() {
    state = state.copyWith(obscurePassword: !state.obscurePassword);
  }

  Future<void> checkSession() async {
    final hasSession = await _isUserLogged();
    state = state.copyWith(isCheckingSession: false, isLogged: hasSession);
  }

  Future<void> login() async {
    final email = state.email.trim();
    final password = state.password;

    if (email.isEmpty || password.isEmpty) {
      state = state.copyWith(
        errorMessage: 'Completa correo y contraseña.',
        isLoading: false,
      );
      return;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);
    final startTime = DateTime.now();
    developer.log(
      'Submitting login from notifier for ${_maskEmail(email)}.',
      name: 'login.notifier',
    );

    try {
      final user = await _loginUser(
        credentials: UserPasswordModel(email: email, password: password),
      );

      final durationMs = DateTime.now().difference(startTime).inMilliseconds;
      developer.log(
        'Login completed successfully for uid ${user.newId} after ${durationMs}ms.',
        name: 'login.notifier',
      );

      state = state.copyWith(
        isLoading: false,
        isLogged: true,
        user: user,
        errorMessage: null,
      );
    } on FirebaseAuthException catch (error, stackTrace) {
      final durationMs = DateTime.now().difference(startTime).inMilliseconds;
      developer.log(
        'Login failed in notifier [${error.code}] after ${durationMs}ms: ${error.message}',
        name: 'login.notifier',
        error: error,
        stackTrace: stackTrace,
        level: 1000,
      );
      state = state.copyWith(
        isLoading: false,
        errorMessage: _mapFirebaseError(error),
      );
    } catch (error, stackTrace) {
      final durationMs = DateTime.now().difference(startTime).inMilliseconds;
      developer.log(
        'Unexpected login error in notifier after ${durationMs}ms: $error',
        name: 'login.notifier',
        error: error,
        stackTrace: stackTrace,
        level: 1000,
      );
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'No se pudo iniciar sesión. Intenta nuevamente.',
      );
    }
  }

  String _mapFirebaseError(FirebaseAuthException error) {
    switch (error.code) {
      case 'user-not-found':
        return 'No existe una cuenta con ese correo.';
      case 'wrong-password':
      case 'invalid-credential':
        return 'Correo o contraseña inválidos.';
      case 'invalid-email':
        return 'El formato del correo no es válido.';
      case 'network-request-failed':
        return 'Error de red al autenticar. Si estas en red corporativa, permite acceso a identitytoolkit.googleapis.com y securetoken.googleapis.com.';
      default:
        return error.message ?? 'Error de autenticación.';
    }
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

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  final datasource = FirebaseLoginDatasource(auth: FirebaseAuth.instance);
  final repository = LoginRepositoryImpl(datasource: datasource);

  return LoginNotifier(LoginUser(repository), IsUserLogged(repository));
});
