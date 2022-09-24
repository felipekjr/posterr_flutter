import '../../../data/data.dart';
import '../../../domain/repositories/repositories.dart';
import '../data_sources/data_sources.dart';

UserRepository makeUserRepository() {
  return UserRepositoryImpl(localDataSource: makeLocalUserDataSource());
}