import 'package:dartz/dartz.dart';

import '../entities/user_entity.dart';
import '../helpers/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUser({required String username});
  Future<Either<Failure, List<UserEntity>>> getUsers();
}