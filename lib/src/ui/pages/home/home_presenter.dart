import 'package:flutter/foundation.dart';
import '../../../domain/entities/entities.dart';
import '../../../presentation/base_presenter.dart';

abstract class HomePresenter extends BasePresenter {
  late final ValueNotifier<List<PostEntity>?> postsNotifier;

  Future<void> getAllPosts();
  Future<void> createNewPost();
}