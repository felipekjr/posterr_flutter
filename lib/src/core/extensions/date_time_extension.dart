import 'package:jiffy/jiffy.dart';

extension DateTimeExt on DateTime {
  String humanized() {
    return Jiffy(toString()).fromNow();
  }
}