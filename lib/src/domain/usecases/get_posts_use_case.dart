import '../entities/entities.dart';

abstract class GetPosts {
  Future<List<PostEntity>> call();
}