import 'package:flutter_prototype/features/login/data/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  const UserEntity._();

  const factory UserEntity({
    required int id,
    required String username,
    required String email,
    required String firstName,
    required String lastName,
    required String gender,
    required String image,
    required String accessToken,
    required String newId,
  }) = _UserEntity;

  factory UserEntity.fromModel(UserModel model) {
    return UserEntity(
      id: model.id,
      username: model.username,
      email: model.email,
      firstName: model.firstName,
      lastName: model.lastName,
      gender: model.gender,
      image: model.image,
      accessToken: model.accessToken,
      newId: model.newId,
    );
  }
}
