import 'package:flutter/widgets.dart';

class NavigationService {
  NavigationService._();
  static final NavigationService instance = NavigationService._();

  late final GlobalKey<NavigatorState> navigation;

  Future navigateTo<T>(String page, {T? args}) async {
    await navigation.currentState?.pushNamed(page, arguments: args);
  }

  BuildContext? getContext() {
    return navigation.currentContext;
  }
}