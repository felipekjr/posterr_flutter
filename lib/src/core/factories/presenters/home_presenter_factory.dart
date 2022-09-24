import 'package:get_it/get_it.dart';
import 'package:posterr_flutter/src/core/services/services.dart';

import '../../../domain/usecases/usecases.dart';
import '../../../presentation/value_notifier_home_presenter.dart';
import '../../../ui/pages/home/home.dart';

HomePresenter makeHomePresenter() {
  return ValueNotifierHomePresenter(
    createPost: GetIt.I.get<CreatePost>(),
    createQuote: GetIt.I.get<CreateQuote>(),
    createRepost: GetIt.I.get<CreateRepost>(),
    getPosts: GetIt.I.get<GetPosts>(),
    userSessionService: GetIt.I.get<UserSessionService>()
  );
}
