import 'package:flutter/foundation.dart';

import '../../../domain/entities/entities.dart';

abstract class ProfilePresenter {
  late final ValueNotifier<List<PostEntity>> postsNotifier;

  Future<void> getPosts();
  Future<void> makeSimplePost({
    PostEntity text,
  });
}