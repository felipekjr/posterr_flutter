import 'package:hive/hive.dart';
import 'package:posterr_flutter/src/data/data.dart';
import 'package:posterr_flutter/src/data/models/post_model.dart';
import 'package:posterr_flutter/src/domain/entities/post_entity.dart';
import 'package:posterr_flutter/src/external/external.dart';

class LocalPostDataSource implements PostDataSource<LocalPostModel> {
  final Box<LocalPostModel> box;

  LocalPostDataSource({required this.box});

  @override
  Future<List<LocalPostModel>> getAll() async {
    return box.values.toList();
  }

  @override
  Future<List<LocalPostModel>> getByAuthorId(String authorId) async {
    return box.values.where((LocalPostModel e) => e.authorId == authorId).toList();
  }

  @override
  Future<LocalPostModel> save(PostEntity post) async {
    final postModel = LocalPostModel.fromEntity(post);
    final id = await box.add(postModel);
    return postModel.copy(id: id.toString());
  }
}