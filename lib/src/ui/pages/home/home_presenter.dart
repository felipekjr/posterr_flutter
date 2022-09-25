import 'package:flutter/foundation.dart';
import 'package:posterr_flutter/src/core/services/user_session_service.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/helpers/helpers.dart';
import '../../../presentation/base_presenter.dart';

abstract class HomePresenter extends BasePresenter {
  UserSessionService get userSessionService;
  late final ValueNotifier<List<PostEntity>> postsNotifier;

  Future<void> getAllPosts();
  Future<void> makeNewPost(
    PostEntity postEntity, {
    required PostType postType,
    String? quote,
  });
}
