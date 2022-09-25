import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/core/services/user_session_service.dart';

class UserSessionServiceMock extends Mock implements UserSessionService {
  void mockUsername(String v) => when(() => activeUsername).thenReturn(v);
}