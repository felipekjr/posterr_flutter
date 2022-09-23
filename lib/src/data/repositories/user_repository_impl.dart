import 'package:posterr_flutter/src/domain/helpers/failure.dart';
import 'package:posterr_flutter/src/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:posterr_flutter/src/domain/repositories/repositories.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<Either<Failure, UserEntity>> getUser({required String username}) {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}