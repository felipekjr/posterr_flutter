import 'package:dartz/dartz.dart';

import './user_can_post_use_case.dart';
import '../entities/entities.dart';
import '../helpers/helpers.dart';
import '../repositories/post_repository.dart';

abstract class CreatePost {
  Future<Either<Failure, PostEntity>> call(PostEntity entity);
}

class CreatePostImpl implements CreatePost {
  final PostRepository repository;
  final UserCanPost userCanPost;

  CreatePostImpl({required this.repository, required this.userCanPost});

  @override
  Future<Either<Failure, PostEntity>> call(PostEntity entity) async {
    if (await userCanPost(userId: entity.author.id!)) {
      return repository.create(post: entity);
    } else {
      return const Left(ValidationFailure('You have reached the daily post limit'));
    }
  }
}
