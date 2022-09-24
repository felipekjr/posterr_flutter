import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../core/extensions/extensions.dart';
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
  final GetActiveUser getActiveUser;

  ValueNotifierHomePresenter({
    required this.createPost,
    required this.createQuote,
    required this.createRepost,
    required this.getPosts,
    required this.getActiveUser,
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
      final author =(await getActiveUser()).right();

      final res = await _makePost(postType, postEntity, author, quote: quote);

      res.fold(
        (failure) => _setStatus(UIErrorState(failure.message)),
        (data) {
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

  Future<Either<Failure, PostEntity>> _makePost(
    PostType type,
    PostEntity entity,
    UserEntity loggedUser, {
    String? quote,
  }) {
    final newPost = entity.copy(author: loggedUser.username);
    if (type == PostType.quote) {
      return createQuote(
        post: newPost,
        quoteAuthor: newPost.author,
        text: quote ?? '',
      );
    }
    if (type == PostType.repost) {
      return createRepost(post: newPost, newAuthor: newPost.author);
    }
    return createPost(newPost);
  }

  void _setStatus(UIState s) => state.value = s;

  @override
  void onDispose() {
    state.dispose();
    postsNotifier.dispose();
  }
}
