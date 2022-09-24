import 'package:flutter/foundation.dart';
import 'package:posterr_flutter/src/core/services/services.dart';
import 'package:posterr_flutter/src/domain/entities/post_entity.dart';
import 'package:posterr_flutter/src/domain/entities/user_entity.dart';
import 'package:posterr_flutter/src/domain/usecases/usecases.dart';
import 'package:posterr_flutter/src/presentation/helpers/ui_state.dart';
import 'package:posterr_flutter/src/ui/pages/pages.dart';

class ValueNotifierProfilePresenter implements ProfilePresenter {
  final GetUserPosts getUserPosts;
  final UserSessionService userSessionService;
  final GetUser getUser;

  ValueNotifierProfilePresenter({
    required this.getUserPosts,
    required this.userSessionService,
    required this.getUser,
  });

  @override
  late ValueNotifier<List<PostEntity>> postsNotifier;

  @override
  late ValueNotifier<UIState> state;

  @override
  late ValueNotifier<UserEntity?> loggedUserNotifier;

  @override
  void onInit() {
    state = ValueNotifier(const UIInitialState());
    postsNotifier = ValueNotifier([]);
    loggedUserNotifier = ValueNotifier(null);
  }

  @override
  Future<void> getLoggedUser() async {
    state.value = const UILoadingState();
    final res = await getUser(userSessionService.activeUsername!);
    res.fold(
      (failure) => _setStatus(UIErrorState(failure.message)),
      (data) {
        loggedUserNotifier.value = data;
        _setStatus(const UIInitialState());
      },
    );
  }

  @override
  Future<void> getPosts() async {
    state.value = const UILoadingState();
    final loggedUserId = loggedUserNotifier.value?.username ?? userSessionService.activeUsername!;
    final res = await getUserPosts(userId: loggedUserId);
    res.fold(
      (failure) => _setStatus(UIErrorState(failure.message)),
      (data) {
        postsNotifier.value = data;
        _setStatus(const UIInitialState());
      },
    );
  }

  @override
  Future<void> makeSimplePost({required PostEntity text}) {
    // TODO: implement makeSimplePost
    throw UnimplementedError();
  }

  @override
  void onDispose() {
    state.dispose();
    postsNotifier.dispose();
    loggedUserNotifier.dispose();
  }

  void _setStatus(UIState s) => state.value = s;
}
