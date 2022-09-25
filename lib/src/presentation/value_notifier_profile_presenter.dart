import 'package:flutter/foundation.dart';
import 'package:posterr_flutter/src/core/services/services.dart';
import 'package:posterr_flutter/src/domain/entities/post_entity.dart';
import 'package:posterr_flutter/src/domain/entities/user_entity.dart';
import 'package:posterr_flutter/src/domain/helpers/helpers.dart';
import 'package:posterr_flutter/src/domain/usecases/usecases.dart';
import 'package:posterr_flutter/src/presentation/helpers/ui_state.dart';
import 'package:posterr_flutter/src/ui/pages/pages.dart';

class ValueNotifierProfilePresenter implements ProfilePresenter {
  final GetUserPosts getUserPosts;
  final UserSessionService userSessionService;
  final GetUser getUser;
  final CreatePost createPost;

  ValueNotifierProfilePresenter({
    required this.getUserPosts,
    required this.userSessionService,
    required this.getUser,
    required this.createPost,
  });

  @override
  late ValueNotifier<List<PostEntity>> postsNotifier;

  @override
  late ValueNotifier<UIState> state;

  @override
  late ValueNotifier<UserEntity> loggedUserNotifier;

  @override
  void onInit() {
    state = ValueNotifier(const UIInitialState());
    postsNotifier = ValueNotifier([]);
    loggedUserNotifier = ValueNotifier(userSessionService.activeUser!);
  }

  // @override
  // Future<void> getLoggedUser() async {
  //   state.value = const UILoadingState();
  //   final res = await getUser(userSessionService.activeUsername!);
  //   res.fold(
  //     (failure) => _setStatus(UIErrorState(failure.message)),
  //     (data) {
  //       loggedUserNotifier.value = data;
  //       _setStatus(const UIInitialState());
  //     },
  //   );
  // }

  @override
  Future<void> getPosts() async {
    state.value = const UILoadingState();
    final res = await getUserPosts(userId: loggedUserNotifier.value.id!);
    res.fold(
      (failure) => _setStatus(UIErrorState(failure.message)),
      (data) {
        postsNotifier.value = data;
        _setStatus(const UIInitialState());
      },
    );
  }

  @override
  Future<void> makeSimplePost({required String text}) async {
    try {
      state.value = const UILoadingState();
      final author = userSessionService.activeUser!;
      final post = PostEntity(
        createdAt: DateTime.now(),
        author: author,
        type: PostType.normal,
        text: text,
      );

      final res = await createPost(post);

      res.fold(
        (failure) => _setStatus(UIErrorState(failure.message)),
        (data) {
          postsNotifier.value = [data, ...postsNotifier.value];
          _setStatus(const UISuccessState('Your post was sent.'));
        },
      );
    } catch (_) {
      _setStatus(
        const UIErrorState('Unexpected error while creating new post'),
      );
    }
  }

  @override
  void onDispose() {
    state.dispose();
    postsNotifier.dispose();
    loggedUserNotifier.dispose();
  }

  void _setStatus(UIState s) => state.value = s;
}
