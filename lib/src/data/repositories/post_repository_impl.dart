import 'package:dartz/dartz.dart';
import 'package:posterr_flutter/src/data/models/post_model.dart';
import 'package:posterr_flutter/src/external/external.dart';

import '../../domain/entities/post_entity.dart';
import '../../domain/helpers/failure.dart';
import '../../domain/repositories/post_repository.dart';
import '../data_sources/post_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSource<PostModel> localDataSource;

  PostRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, PostEntity>> create({required PostEntity post}) async {
    try {
      final res = await localDataSource.save(post);
      return Right(res.toEntity());
    } catch (e) {
      return const Left(UnexpectedFailure('Unexpected error while creating the post'));
    }
  }

  @override
  Future<Either<Failure, List<PostEntity>>> getAll() async {
    try {
      final res = await localDataSource.getAll();
      return Right(_sort(res).map((e) => e.toEntity()).toList());
    } catch (e) {
      return const Left(UnexpectedFailure('Error while loading posts'));
    }
  }

  @override
  Future<Either<Failure, List<PostEntity>>> getByUser({required String id}) async {
    try {
      final res = await localDataSource.getByAuthorId(id);
      return Right(_sort(res).map((e) => e.toEntity()).toList());
    } catch (e) {
      return const Left(UnexpectedFailure('Error while loading posts'));
    }
  }
  
  @override
  Future<Either<Failure, PostEntity>> getById({required String id}) async {
    try {
      final res = await localDataSource.getById(id);
      return Right(res.toEntity());
    } catch (e) {
      return const Left(UnexpectedFailure('Error while getting the post'));
    }
  }

  List<PostModel> _sort(List<PostModel> posts) {
    posts.sort((a, b) => a.creationDate.isBefore(b.creationDate) ? 1 : 0);
    return posts;
  }
}