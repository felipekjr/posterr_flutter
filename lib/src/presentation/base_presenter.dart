import 'package:flutter/foundation.dart';

import 'helpers/helpers.dart';

abstract class BasePresenter {
  final ValueNotifier<UIState> state = ValueNotifier(const UIInitialState());

  void onInit();
  void onDispose();
}