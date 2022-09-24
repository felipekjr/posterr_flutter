import 'package:dartz/dartz.dart';
import 'package:posterr_flutter/src/data/data.dart';
import 'package:posterr_flutter/src/data/models/user_model.dart';
import 'package:posterr_flutter/src/domain/entities/user_entity.dart';
import 'package:posterr_flutter/src/domain/helpers/failure.dart';
import 'package:posterr_flutter/src/domain/repositories/repositories.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource<UserModel> localDataSource;

  UserRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, UserEntity>> getUser({required String username}) async {
    try {
      final res = await localDataSource.getByName(username);
      return Right(res.toEntity());
    } catch (_) {
      return const Left(UnexpectedFailure('Fail to get user.'));
    }
  }
  
  @override
  Future<Either<Failure, List<UserEntity>>> getUsers() async {
    try {
      final res = await localDataSource.getAll();
      return Right(res.map((e) => e.toEntity()).toList());
    } catch (_) {
      return const Left(UnexpectedFailure('Fail to get users.'));
    }
  }
}