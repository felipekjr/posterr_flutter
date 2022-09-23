import 'package:dartz/dartz.dart';
import 'package:posterr_flutter/src/domain/entities/entities.dart';
import 'package:posterr_flutter/src/domain/helpers/helpers.dart';
import 'package:posterr_flutter/src/domain/repositories/post_repository.dart';

abstract class CreateRepost {
  Future<Either<Failure, PostEntity>> call({
    required PostEntity post,
    required String newAuthor,
  });
}

class CreateRepostImpl implements CreateRepost {
  final PostRepository repository;

  CreateRepostImpl({required this.repository});

  @override
  Future<Either<Failure, PostEntity>> call({
    required PostEntity post,
    required String newAuthor,
  }) async {
    final quotedPost = post.copy(
      type: PostType.repost,
      author: newAuthor,
      childId: post.id,
      newPost: true,
    );
    return repository.create(post: quotedPost);
  }
}
