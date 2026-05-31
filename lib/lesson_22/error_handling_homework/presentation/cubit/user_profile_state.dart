import 'package:flutter_homework/lesson_22/error_handling_homework/data/repository/entity/user_entity.dart';
import 'package:flutter_homework/lesson_22/myerror.dart';

sealed class UserProfileState {}

final class UserProfileLoading implements UserProfileState {}

final class UserProfileLoaded implements UserProfileState {
  UserProfileLoaded(this.user);

  final UserEntity user;
}

final class UserProfileError implements UserProfileState {
  final CustomServerError error;

  UserProfileError(this.error);
}
