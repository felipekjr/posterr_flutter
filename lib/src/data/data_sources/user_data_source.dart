import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract class UserDataSource<T extends PostModel> {
  Future<PostModel> save(PostEntity post);
  Future<List<T>> getAll();
  Future<List<T>> getByAuthorId(String authorId);
}