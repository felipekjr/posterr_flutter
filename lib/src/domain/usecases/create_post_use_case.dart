import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../helpers/helpers.dart';
import '../repositories/post_repository.dart';

abstract class CreatePost {
  Future<Either<Failure, PostEntity>> call(PostEntity entity);
}

class CreatePostImpl implements CreatePost {
  final PostRepository repository;

  CreatePostImpl({required this.repository});

  @override
  Future<Either<Failure, PostEntity>> call(PostEntity entity) async {
    return await repository.create(post: entity);
  }

}