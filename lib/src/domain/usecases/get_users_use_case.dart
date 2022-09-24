import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../helpers/helpers.dart';
import '../repositories/repositories.dart';

abstract class GetUsers {
  Future<Either<Failure, List<UserEntity>>> call();
}

class GetUsersImpl implements GetUsers {
  final UserRepository repository;

  GetUsersImpl({
    required this.repository,
  });
  
  @override
  Future<Either<Failure, List<UserEntity>>> call() async {
    return repository.getUsers();
  }
}