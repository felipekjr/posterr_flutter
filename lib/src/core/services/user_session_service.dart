import 'package:flutter/foundation.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/get_user_use_case.dart';

class UserSessionService {
  final GetUser getUser;

  String? _activeUsername;

  UserSessionService(this.getUser);

  String? get activeUsername => _activeUsername;

  UserEntity? activeUser;

  Future<void> setActiveUser(String username) async {
    _activeUsername = username;
    final res = await getUser(username);
    res.fold(
      (l) => debugPrint('error while setting active user'),
      (r) => activeUser = r,
    );
  }
}
