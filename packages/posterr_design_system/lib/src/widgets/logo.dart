import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/logo.png', package: 'posterr_design_system', width: 65, height: 20,);
  }
}