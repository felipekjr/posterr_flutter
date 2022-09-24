import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract class UserDataSource<T extends UserModel> {
  Future<void> save(UserEntity userEntity);
  Future<List<T>> getAll();
  Future<T> getByName(String name);
}