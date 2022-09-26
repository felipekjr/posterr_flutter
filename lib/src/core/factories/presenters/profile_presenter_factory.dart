import 'package:get_it/get_it.dart';

import '../../../core/services/services.dart';
import '../../../domain/usecases/usecases.dart';
import '../../../presentation/value_notifier_profile_presenter.dart';
import '../../../ui/pages/pages.dart';

ProfilePresenter makeProfilePresenter() {
  return ValueNotifierProfilePresenter(
    getUserPosts: GetIt.I.get<GetUserPosts>(), 
    userSessionService: GetIt.I.get<UserSessionService>(),
    getUser: GetIt.I.get<GetUser>(),
    createPost: GetIt.I.get<CreatePost>(),
  );
}
