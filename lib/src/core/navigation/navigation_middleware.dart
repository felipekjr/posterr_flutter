import 'package:flutter/widgets.dart';

class NavigatorMiddleware extends RouteObserver<PageRoute> {

  @override
  void didPush(Route route, Route? previousRoute) {
    debugPrint(
      'LOG: ${previousRoute?.settings.name} => ${route.settings.name}',
    );
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? goingRoute) {
    debugPrint(
      'LOG: ${route.settings.name} => ${goingRoute?.settings.name}',
    );
    super.didPop(route, goingRoute);
  }
}
