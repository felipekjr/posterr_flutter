import 'package:flutter/foundation.dart';

import 'helpers/helpers.dart';

abstract class BasePresenter {
  late final ValueNotifier<UIState> state;
  void onInit();
  void onDispose();
}