import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../helpers/failure.dart';
import '../repositories/repositories.dart';

abstract class GetPosts {
  Future<Either<Failure, List<PostEntity>>> call();
}

class GetPostsImpl implements GetPosts {
  final PostRepository repository;

  const GetPostsImpl({required this.repository});
  
  @override
  Future<Either<Failure, List<PostEntity>>> call() {
    return repository.getAll();
  }
}