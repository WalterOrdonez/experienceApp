import 'package:flutter_prototype/features/login/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isLoading,
    @Default(true) bool isCheckingSession,
    @Default(false) bool isLogged,
    @Default(true) bool obscurePassword,
    UserEntity? user,
    String? errorMessage,
  }) = _LoginState;
}
