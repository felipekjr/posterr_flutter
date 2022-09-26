import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/core/services/user_session_service.dart';
import 'package:posterr_flutter/src/domain/entities/user_entity.dart';

class UserSessionServiceMock extends Mock implements UserSessionService {
  void mockUsername(UserEntity v) => when(() => activeUser).thenReturn(v);
}