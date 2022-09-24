import 'package:get_it/get_it.dart';

import '../../domain/usecases/usecases.dart';
import '../../ui/pages/pages.dart';
import '../factories/factories.dart';

class BindingsConfig {
  BindingsConfig();

  static Future<void> start() async {
    final GetIt g = GetIt.instance;
    final getActiveUserUseCase = await makeGetActiveUser();
    
    // Use cases
    g.registerSingleton<GetPosts>(makeGetAllPosts());
    g.registerSingleton<GetUserPosts>(makeGetUserPosts());
    g.registerSingleton<CreatePost>(makeCreatePost());
    g.registerSingleton<CreateQuote>(makeCreateQuot());
    g.registerSingleton<CreateRepost>(makeCreateRepost());
    g.registerSingleton<GetActiveUser>(getActiveUserUseCase);

    // Presenters
    g.registerLazySingleton<HomePresenter>(() => makeHomePresenter());
    g.registerLazySingleton<ProfilePresenter>(() => makeProfilePresenter());
  }
}
