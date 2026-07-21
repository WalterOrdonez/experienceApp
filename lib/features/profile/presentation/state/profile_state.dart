import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

/// Estado de la vista de perfil
@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.loaded({required String? profileImageUrl}) =
      _Loaded;
  const factory ProfileState.uploading({required String? profileImageUrl}) =
      _Uploading;
  const factory ProfileState.error({required String message}) = _Error;
}
