import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../helpers/failure.dart';
import '../repositories/repositories.dart';

abstract class GetUserPosts {
  Future<Either<Failure, List<PostEntity>>> call({required String userId});
}

class GetUserPostsImpl implements GetUserPosts {
  final PostRepository repository;

  const GetUserPostsImpl({required this.repository});
  
  @override
  Future<Either<Failure, List<PostEntity>>> call({required String userId}) {
    return repository.getByUser(id: userId);
  }
}