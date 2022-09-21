import '../../domain/entities/entities.dart';
import '../models/models.dart';

abstract class PostDataSource {
  Future<PostModel> save(PostEntity post);
  Future<List<PostModel>> getAll();
  Future<List<PostModel>> getByAuthorId(String authorId);
}