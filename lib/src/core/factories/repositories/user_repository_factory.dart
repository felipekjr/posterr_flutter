import '../../../data/data.dart';
import '../../../domain/repositories/repositories.dart';

UserRepository makeUserRepository() {
  return UserRepositoryImpl();
}