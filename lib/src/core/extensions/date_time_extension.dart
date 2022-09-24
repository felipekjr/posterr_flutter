import 'package:jiffy/jiffy.dart';

extension DateTimeExt on DateTime {
  String humanized() {
    if (Jiffy(this).diff(Jiffy(DateTime.now()), Units.DAY) > 1) {
      Jiffy(toString()).yMMMMd;
    }
    return Jiffy(toString()).fromNow();
  }
}