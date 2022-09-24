import 'package:hive/hive.dart';

import '../../../external/data_sources/data_sources.dart';
import '../../consts/consts.dart';

LocalPostDataSource makeLocalPostDataSource() => LocalPostDataSource(
      box: Hive.box(Consts.postBox),
    );
