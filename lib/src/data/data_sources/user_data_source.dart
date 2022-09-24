import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract class UserDataSource<T extends UserModel> {
  Future<T> save(UserEntity user);
  Future<T> setActive(String username);
  Future<T> getActive(String username);
}