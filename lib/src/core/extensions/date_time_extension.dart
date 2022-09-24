import 'package:jiffy/jiffy.dart';

extension DateTimeExt on DateTime {
  String humanized() {
    if (Jiffy(DateTime.now()).diff(Jiffy(this), Units.DAY) > 1) {
      return Jiffy(toString()).yMMMMd;
    }
    return Jiffy(toString()).fromNow();
  }
}