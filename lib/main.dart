import 'package:flutter/material.dart';

import 'src/core/navigation/navigation.dart';
import 'src/core/routes/route.dart';

void main() {
  runApp(const Posterr());
}

class Posterr extends StatefulWidget {
  const Posterr({Key? key}) : super(key: key);

  @override
  State<Posterr> createState() => _PosterrState();
}

class _PosterrState extends State<Posterr> {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey();

  @override
  void initState() {
    NavigationService.instance.navigation = _navigationKey;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posterr',
      routes: RouteHandler.routes,
      initialRoute: NamedRoute.home,
      navigatorObservers: [
        NavigatorMiddleware()
      ],
      navigatorKey: _navigationKey,
    );
  }
}