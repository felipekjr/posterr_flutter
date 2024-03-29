import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:posterr_flutter/src/core/services/services.dart';

import '../domain/entities/entities.dart';
import '../domain/helpers/helpers.dart';
import '../domain/usecases/usecases.dart';
import '../presentation/helpers/ui_state.dart';
import '../ui/pages/home/home.dart';

class ValueNotifierHomePresenter implements HomePresenter {
  final CreatePost createPost;
  final CreateQuote createQuote;
  final CreateRepost createRepost;
  final GetPosts getPosts;
  
  @override
  final UserSessionService userSessionService;

  ValueNotifierHomePresenter({
    required this.createPost,
    required this.createQuote,
    required this.createRepost,
    required this.getPosts,
    required this.userSessionService,
  });

  @override
  late ValueNotifier<UIState> state;

  @override
  late ValueNotifier<List<PostEntity>> postsNotifier;

  List<PostEntity> get posts => postsNotifier.value;

  @override
  void onInit() {
    state = ValueNotifier(const UIInitialState());
    postsNotifier = ValueNotifier([]);
  }

  @override
  Future<void> makeNewPost(
    PostEntity postEntity, {
    required PostType postType,
    String? quote,
  }) async {
    try {
      state.value = const UILoadingState();
      final author = userSessionService.activeUser!;

      final res = await _makePost(postType, postEntity, author, quote: quote);

      res.fold(
        (failure) => _setStatus(UIErrorState(failure.message)),
        (data) {
          postsNotifier.value = [data, ...posts];
          _setStatus(const UISuccessState('Your post was sent.'));
        },
      );
    } catch (_) {
      _setStatus(const UIErrorState('Unexpected error while creating new post'));
    }
  }

  @override
  Future<void> getAllPosts() async {
    state.value = const UILoadingState();
    final res = await getPosts();
    res.fold(
      (failure) => _setStatus(UIErrorState(failure.message)),
      (data) {
        postsNotifier.value = data;
        _setStatus(const UIInitialState());
      },
    );
  }

  @override
  Future<PostEntity> getTappedPost(String postId) async {
    state.value = const UILoadingState();
    return posts.firstWhere((e) => e.id == postId);
  }

  Future<Either<Failure, PostEntity>> _makePost(
    PostType type,
    PostEntity entity,
    UserEntity loggedUser, {
    String? quote,
  }) {
    if (type == PostType.quote) {
      return createQuote(
        childPost: entity,
        quoteAuthor: loggedUser,
        text: quote ?? '',
      );
    }
    if (type == PostType.repost) {
      return createRepost(childPost: entity, newAuthor: loggedUser);
    }
    return createPost(entity.copy(author: loggedUser));
  }

  void _setStatus(UIState s) => state.value = s;

  @override
  void onDispose() {
    state.dispose();
    postsNotifier.dispose();
  }

}
