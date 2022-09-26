import 'package:flutter/foundation.dart';
import 'package:posterr_flutter/src/domain/helpers/helpers.dart';
import 'package:posterr_flutter/src/presentation/base_presenter.dart';

import '../../../domain/entities/entities.dart';

abstract class ProfilePresenter extends BasePresenter {
  late final ValueNotifier<UserEntity> loggedUserNotifier;
  late final ValueNotifier<List<PostEntity>> postsNotifier;
  late ValueNotifier<Map<PostType, int>> userPostsCount;
  
  // Future<void> getLoggedUser();
  Future<void> getPosts();

  Future<void> makeSimplePost({
    required String text,
  });
}