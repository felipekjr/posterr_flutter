import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/domain/usecases/user_can_post_use_case.dart';

class UserCanPostMock extends Mock implements UserCanPost {
  void mockRes(bool res) => when(() => call(userId: any(named: 'userId'))).thenAnswer((_) => Future.value(res));
}