import 'package:get_it/get_it.dart';
import 'package:posterr_flutter/src/core/consts/consts.dart';
import 'package:posterr_flutter/src/core/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import '../factories/data_sources/data_sources.dart';

class MockConfig {
  static Future<void> insertDefaultData() async {
    final userDS = makeLocalUserDataSource();
    final postDS = makeLocalPostDataSource();

    // Setup active user
    const activeUsername = 'John Doe';
    final userSession = GetIt.I.get<UserSessionService>();
    final activeUser = await userDS.save( UserEntity(username: activeUsername, createdAt: DateTime.now()));

    await userSession.setActiveUser(activeUsername);

    // Check if is first launch
    final prefs = await SharedPreferences.getInstance();
    if (!(prefs.getBool(Consts.firstTime) ?? false)) {
      prefs.setBool(Consts.firstTime, true);
    } else {
      return;
    }

    // Create users
    final otherUser = await userDS.save(UserEntity(
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
        author: otherUser.toEntity(),
        type: PostType.normal,
        text: 'Hello world! This is my first post on Posterr and this is amazing!'
      ),
    );
    postDS.save(
      PostEntity(
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        author: otherUser.toEntity(),
        type: PostType.normal,
        text: 'Have a nice day'
      ),
    );
  }
}
