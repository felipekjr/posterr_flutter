import 'package:dartz/dartz.dart';

import '../../domain/entities/post_entity.dart';
import '../../domain/helpers/failure.dart';
import '../../domain/repositories/post_repository.dart';
import '../data_sources/post_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSource dataSource;

  PostRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, PostEntity>> create({required PostEntity post}) async {
    try {
      final res = await dataSource.save(post);
      return Right(res.toEntity());
    } catch (e) {
      return const Left(UnexpectedFailure('Unexpected error while creating the post'));
    }
  }

  @override
  Future<Either<Failure, List<PostEntity>>> getAll() async {
    try {
      final res = await dataSource.getAll();
      return Right(res.map((e) => e.toEntity()).toList());
    } catch (e) {
      return const Left(UnexpectedFailure('Error while loading posts'));
    }
  }

  @override
  Future<Either<Failure, List<PostEntity>>> getByUser({required String id}) async {
    // TODO: implement getByUser
    throw UnimplementedError();
  }
}