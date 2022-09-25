import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../helpers/helpers.dart';
import '../repositories/post_repository.dart';
import 'user_can_post_use_case.dart';

abstract class CreateRepost {
  Future<Either<Failure, PostEntity>> call({
    required PostEntity post,
    required UserEntity newAuthor,
  });
}

class CreateRepostImpl implements CreateRepost {
  final PostRepository repository;
  final UserCanPost userCanPost;

  CreateRepostImpl({required this.repository, required this.userCanPost,});

  @override
  Future<Either<Failure, PostEntity>> call({
    required PostEntity post,
    required UserEntity newAuthor,
  }) async {
    if (await userCanPost(userId: newAuthor.id!)) {
      final quotedPost = post.copy(
        type: PostType.repost,
        author: newAuthor,
        childId: post.id,
        newPost: true,
      );
      return repository.create(post: quotedPost);
    } else {
      return const Left(ValidationFailure('You have reached the daily post limit'));
    }
  }
}
