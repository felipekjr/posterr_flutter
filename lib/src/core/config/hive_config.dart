import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../external/external.dart';
import '../consts/consts.dart';

class HiveConfig {
  static Future<void> start() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    // Register adapter
    Hive.registerAdapter(LocalUserModelAdapter());
    Hive.registerAdapter(LocalPostModelAdapter());

    // Open box
    await HiveConfig.open<LocalUserModel>(Consts.userBox);
    await HiveConfig.open<LocalPostModel>(Consts.postBox);
  }

  static Future<Box> open<T>(String boxName) async {
    return await Hive.openBox<T>(boxName);
  }
}
