import '../../../data/data_sources/data_sources.dart';
import '../../../data/models/post_model.dart';
import '../../../domain/entities/post_entity.dart';

class LocalUserDataSource implements UserDataSource {
  @override
  Future<List<PostModel>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getByAuthorId(String authorId) {
    // TODO: implement getByAuthorId
    throw UnimplementedError();
  }

  @override
  Future<PostModel> save(PostEntity post) {
    // TODO: implement save
    throw UnimplementedError();
  }
}