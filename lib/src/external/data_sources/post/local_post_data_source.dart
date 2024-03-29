import 'package:hive/hive.dart';

import '../../../data/data.dart';
import '../../../domain/entities/entities.dart';
import '../../../external/external.dart';

class LocalPostDataSource implements PostDataSource<LocalPostModel> {
  final Box<LocalPostModel> box;

  LocalPostDataSource({required this.box});

  @override
  Future<List<LocalPostModel>> getAll() async {
    return box.values.toList();
  }

  @override
  Future<List<LocalPostModel>> getByAuthorId(String authorId) async {
    return box.values.where((LocalPostModel e) => e.author.id == authorId).toList();
  }

  @override
  Future<LocalPostModel> save(PostEntity post) async {
    final postModel = LocalPostModel.fromEntity(post);
    final id = await box.add(postModel);
    final postWithId = postModel.copy(id: id.toString());
    await box.put(id, postWithId);
    return postWithId;
  }
  
  @override
  Future<LocalPostModel> getById(String id) async {
    return box.values.firstWhere((e) => e.id == id);
  }
}