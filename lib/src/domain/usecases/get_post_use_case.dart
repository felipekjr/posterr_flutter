import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../helpers/failure.dart';
import '../repositories/repositories.dart';

abstract class GetPost {
  Future<Either<Failure, PostEntity>> call({required String id});
}

class GetPostImpl implements GetPost {
  final PostRepository repository;

  const GetPostImpl({required this.repository});
  
  @override
  Future<Either<Failure, PostEntity>> call({required String id}) {
    return repository.getById(id: id);
  }
}