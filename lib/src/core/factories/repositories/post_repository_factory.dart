import 'package:hive/hive.dart';

import '../../../data/repositories/repositories.dart';
import '../../../domain/repositories/repositories.dart';
import '../../../external/data_sources/data_sources.dart';
import '../../consts/consts.dart';

PostRepository makePostRepository() {
  return PostRepositoryImpl(
    localDataSource: LocalPostDataSource(
      box: Hive.box(Consts.postBox),
    ),
  );
}
