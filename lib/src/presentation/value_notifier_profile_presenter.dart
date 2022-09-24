import 'package:flutter/foundation.dart';
import 'package:posterr_flutter/src/domain/entities/post_entity.dart';
import 'package:posterr_flutter/src/presentation/helpers/ui_state.dart';
import 'package:posterr_flutter/src/ui/pages/pages.dart';

class ValueNotifierProfilePresenter implements ProfilePresenter{
  @override
  late ValueNotifier<List<PostEntity>> postsNotifier;

  @override
  late ValueNotifier<UIState> state;

  @override
  Future<void> getPosts() {
    // TODO: implement getPosts
    throw UnimplementedError();
  }

  @override
  Future<void> makeSimplePost({required PostEntity text}) {
    // TODO: implement makeSimplePost
    throw UnimplementedError();
  }



  @override
  void onDispose() {
    // TODO: implement onDispose
  }

  @override
  void onInit() {
    state = ValueNotifier(const UIInitialState());
    postsNotifier = ValueNotifier([]);
  }
  
}