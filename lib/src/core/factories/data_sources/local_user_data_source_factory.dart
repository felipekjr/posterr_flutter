import 'package:hive/hive.dart';

import '../../../external/data_sources/data_sources.dart';
import '../../consts/consts.dart';

LocalUserDataSource makeLocalUserDataSource() => LocalUserDataSource(
      box: Hive.box(Consts.userBox),
    );
