import 'package:get_it/get_it.dart';
import 'package:posterr_flutter/src/core/services/services.dart';

import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import '../factories/data_sources/data_sources.dart';

class MockConfig {
  static Future<void> insertDefaultData() async {
    final userDS = makeLocalUserDataSource();
    final postDS = makeLocalPostDataSource();

    final userSession = GetIt.I.get<UserSessionService>();
    const activeUsername = 'John Doe';
    userSession.setActiveUser(activeUsername);

    // Create users
    userDS.save(
        UserEntity(username: 'Felipe Rodrigues', createdAt: DateTime.now()));
    userDS.save(UserEntity(
        username: 'Davi Dias',
        createdAt: DateTime.now().subtract(const Duration(days: 20),),),);
    userDS.save(UserEntity(
        username: 'John Doe',
        createdAt: DateTime.now().subtract(const Duration(days: 2))));
    userDS.save(UserEntity(
        username: 'Davi Dias',
        createdAt: DateTime.now().subtract(const Duration(days: 1))));

    // Create initial posts
    postDS.save(
      PostEntity(
        createdAt: DateTime.now(),
        author: activeUsername,
        type: PostType.normal,
        text: 'My first post'
      ),
    );
  }
}
