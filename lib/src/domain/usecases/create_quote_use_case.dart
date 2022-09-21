import 'package:dartz/dartz.dart';
import 'package:posterr_flutter/src/domain/entities/entities.dart';
import 'package:posterr_flutter/src/domain/helpers/helpers.dart';
import 'package:posterr_flutter/src/domain/repositories/post_repository.dart';

abstract class CreateQuote {
  Future<Either<Failure, PostEntity>> call({
    required PostEntity post,
    required String text,
    required String quoteAuthor
  });
}

class CreateQuoteImpl implements CreateQuote {
  final PostRepository repository;

  CreateQuoteImpl({required this.repository});

  @override
  Future<Either<Failure, PostEntity>> call({
    required PostEntity post,
    required String text,
    required String quoteAuthor
  }) async {
    final quotedPost = post.copy(
      type: PostType.quote,
      text: text,
      author: quoteAuthor,
      childId: post.id
    );
    return await repository.create(
      post: quotedPost
    );
  }

}