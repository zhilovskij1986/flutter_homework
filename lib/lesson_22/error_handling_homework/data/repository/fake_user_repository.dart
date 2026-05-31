import 'package:flutter_homework/lesson_22/error_handling_homework/data/repository/entity/user_entity.dart';
import 'package:flutter_homework/lesson_22/myerror.dart';

class FakeUserRepository {
  Future<UserEntity> getUserProfile(bool shouldFail) async {
    await Future<void>.delayed(const Duration(seconds: 1));

   try {
      if (shouldFail) {
      throw Exception('Server is temporarily unavailable');
    }
    return UserEntity(id: '1', name: 'Test User');
   } on Exception catch (e) {    

    throw CustomServerError(e.toString());
     
   }
  }
}
