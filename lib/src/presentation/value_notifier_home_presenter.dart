import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:posterr_flutter/src/domain/entities/entities.dart';
import 'package:posterr_flutter/src/domain/usecases/usecases.dart';
import 'package:posterr_flutter/src/presentation/helpers/ui_state.dart';

import '../ui/pages/home/home.dart';

class ValueNotifierHomePresenter implements HomePresenter {
  final CreatePost createPost;
  final CreateQuote createQuote;
  final CreateRepost createRepost;
  final GetPosts getPosts;

  ValueNotifierHomePresenter({
    required this.createPost,
    required this.createQuote,
    required this.createRepost,
    required this.getPosts
  });

  @override
  late ValueNotifier<UIState> state;

  @override
  late ValueNotifier<List<PostEntity>?> postsNotifier;

  @override
  void onInit() {
    state = ValueNotifier(const UIInitialState());
    postsNotifier = ValueNotifier([]);
  }

  @override
  Future<void> createNewPost() {
    // TODO: implement createNewPost
    throw UnimplementedError();
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
      }
    );
  }

  void _setStatus(UIState s) => state.value = s;

  @override
  void onDispose() {
    state.dispose();
    postsNotifier.dispose();
  }
  
}