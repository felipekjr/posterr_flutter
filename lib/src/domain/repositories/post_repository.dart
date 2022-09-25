import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../helpers/failure.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostEntity>>> getAll();
  Future<Either<Failure, List<PostEntity>>> getByUser({required String id});
  Future<Either<Failure, PostEntity>> getById({required String id});
  Future<Either<Failure, PostEntity>> create({required PostEntity post});
}