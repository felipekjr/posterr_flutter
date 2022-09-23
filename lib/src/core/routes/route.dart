import 'package:flutter/widgets.dart';

import '../../ui/pages/pages.dart';

class NamedRoute {
  static const home = '/home';
  static const profile = '/profile';
}

class RouteHandler {
  static final routes = {
    NamedRoute.home: (_) => const HomePage(),
    NamedRoute.profile: (_) => const ProfilePage()
  };

  static Widget _openPage<T>(BuildContext context, Widget Function(T) onPage) {
    final args = ModalRoute.of(context)!.settings.arguments as T;
    return onPage(args);
  }
}