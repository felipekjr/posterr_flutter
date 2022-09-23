import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/domain/entities/user_entity.dart';
import 'package:posterr_flutter/src/domain/usecases/get_active_user_use_case.dart';

class GetActiveUserMock extends Mock implements GetActiveUser {
  void mockSuccess(UserEntity e) => when(() => call()).thenAnswer((_) => Future.value(Right(e)));
}