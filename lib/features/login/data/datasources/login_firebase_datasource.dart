import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_prototype/features/login/data/models/user_model.dart';
import 'package:flutter_prototype/features/login/data/models/user_password_model.dart';

import 'login_datasource.dart';

class FirebaseLoginDatasource implements LoginDatasource {
  final FirebaseAuth _auth;
  FirebaseLoginDatasource({FirebaseAuth? auth})
    : _auth = auth ?? FirebaseAuth.instance;

  @override
  Future<UserModel> login({
    required UserPasswordModel userPasswordModel,
  }) async {
    final credentials = await _auth.signInWithEmailAndPassword(
      email: userPasswordModel.email,
      password: userPasswordModel.password,
    );

    final user = credentials.user;
    if (user == null) {
      throw FirebaseAuthException(
        code: 'null-user',
        message: 'No se pudo recuperar el usuario autenticado.',
      );
    }

    return _mapFirebaseUser(user);
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
}
