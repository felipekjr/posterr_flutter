import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:posterr_flutter/src/data/models/post_model.dart';
import 'package:posterr_flutter/src/external/external.dart';

import '../consts/consts.dart';

class HiveConfig {
   static Future<void> start() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    // Register adapter


    // Open box
    HiveConfig.open(Consts.userBox);
    HiveConfig.open<LocalPostModel>(Consts.postBox);
  }

  static Future<Box> open<T>(String boxName) async {
    return await Hive.openBox<T>(boxName);
  }
}