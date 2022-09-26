import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../helpers/helpers.dart';
import '../repositories/post_repository.dart';
import '../usecases/user_can_post_use_case.dart';

abstract class CreateQuote {
  Future<Either<Failure, PostEntity>> call({
    required PostEntity childPost,
    required String text,
    required UserEntity quoteAuthor,
  });
}

class CreateQuoteImpl implements CreateQuote {
  final PostRepository repository;
  final UserCanPost userCanPost;

  CreateQuoteImpl({required this.repository, required this.userCanPost});

  @override
  Future<Either<Failure, PostEntity>> call({
    required PostEntity childPost,
    required String text,
    required UserEntity quoteAuthor,
  }) async {
    if (await userCanPost(userId: quoteAuthor.id!)) {
       final quotedPost = childPost.copy(
        newPost: true,
        type: PostType.quote,
        text: text,
        author: quoteAuthor,
        childId: childPost.id,
        child: childPost,
        createdAt: DateTime.now()
      );
      return repository.create(post: quotedPost);
    } else {
      return const Left(ValidationFailure('You have reached the daily post limit'));
    }
  }
}
