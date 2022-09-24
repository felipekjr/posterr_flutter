import '../../../data/repositories/repositories.dart';
import '../../../domain/repositories/repositories.dart';
import '../data_sources/data_sources.dart';

PostRepository makePostRepository() {
  return PostRepositoryImpl(
    localDataSource: makeLocalPostDataSource()
  );
}
