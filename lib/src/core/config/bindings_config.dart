import 'package:get_it/get_it.dart';

import '../../domain/usecases/usecases.dart';
import '../../ui/pages/pages.dart';
import '../factories/factories.dart';
import '../services/services.dart';

class BindingsConfig {
  BindingsConfig();

  static Future<void> start() async {
    final GetIt g = GetIt.instance;
    
    // Use cases
    g.registerLazySingleton<GetPosts>(() => makeGetAllPosts());
    g.registerLazySingleton<GetUserPosts>(() => makeGetUserPosts());
    g.registerLazySingleton<CreatePost>(() => makeCreatePost());
    g.registerLazySingleton<CreateQuote>(() => makeCreateQuot());
    g.registerLazySingleton<CreateRepost>(() => makeCreateRepost());
    g.registerLazySingleton<GetUsers>(() => makeGetUsers());
    g.registerLazySingleton<GetUser>(() => makeGetUser());

    // Presenters
    g.registerLazySingleton<HomePresenter>(() => makeHomePresenter());
    g.registerLazySingleton<ProfilePresenter>(() => makeProfilePresenter());

    // User session
    g.registerLazySingleton<UserSessionService>(() => UserSessionService(GetIt.I.get<GetUser>()));
  }
}
