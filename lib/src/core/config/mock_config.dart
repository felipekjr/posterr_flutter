import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/consts/consts.dart';
import '../../core/services/services.dart';
import '../../domain/entities/entities.dart';
import '../../domain/helpers/helpers.dart';
import '../factories/data_sources/data_sources.dart';

class MockConfig {
  static Future<void> insertDefaultData() async {
    final userDS = makeLocalUserDataSource();
    final postDS = makeLocalPostDataSource();

    // Setup active user
    const activeUsername = 'johndoe';
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
    final secondUser = await userDS.save(UserEntity(
        username: 'davidias12',
        createdAt: DateTime.now().subtract(const Duration(days: 20),),),);
    final thirdUser = await userDS.save(UserEntity(
        username: 'marcosl2',
        createdAt: DateTime.now().subtract(const Duration(days: 2))));
    final fourthUser = await userDS.save(UserEntity(
        username: 'felipekjr',
        createdAt: DateTime.now().subtract(const Duration(days: 1))));

    // Create initial posts
    postDS.save(
      PostEntity(
        createdAt: DateTime.now(),
        author: secondUser.toEntity(),
        type: PostType.normal,
        text: 'Hello world! This is my first post on Posterr and this is amazing!'
      ),
    );
    postDS.save(
      PostEntity(
        createdAt: DateTime.now().subtract(const Duration(minutes: 2)),
        author: thirdUser.toEntity(),
        type: PostType.normal,
        text: 'Hello world!'
      ),
    );
    postDS.save(
      PostEntity(
        createdAt: DateTime.now().subtract(const Duration(minutes: 2)),
        author: fourthUser.toEntity(),
        type: PostType.normal,
        text: 'Good morning'
      ),
    );
    final secondMockPost = await postDS.save(
      PostEntity(
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        author: fourthUser.toEntity(),
        type: PostType.normal,
        text: 'Have a nice day'
      ),
    );
    postDS.save(
      PostEntity(
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        author: activeUser.toEntity(),
        type: PostType.quote,
        text: ':)',
        child: secondMockPost.toEntity(),
        childId: secondMockPost.id
      ),
    );
  }
}
