import '../entities/entities.dart';

abstract class PostRepository {
  Future<List<PostEntity>> getAll();
  Future<List<PostEntity>> getByUser({required String id});
  Future<List<PostEntity>> create({required PostEntity post});
}