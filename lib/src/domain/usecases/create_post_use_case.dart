import 'package:dartz/dartz.dart';
import 'package:posterr_flutter/src/domain/entities/entities.dart';
import 'package:posterr_flutter/src/domain/helpers/helpers.dart';
import 'package:posterr_flutter/src/domain/repositories/post_repository.dart';

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