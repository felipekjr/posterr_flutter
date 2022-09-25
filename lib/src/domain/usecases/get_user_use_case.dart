import 'package:dartz/dartz.dart';

import '../entities/entities.dart';
import '../helpers/helpers.dart';
import '../repositories/repositories.dart';

abstract class GetUser {
  Future<Either<Failure, UserEntity>> call(String name);
}

class GetUserImpl implements GetUser {
  final UserRepository repository;

  GetUserImpl({
    required this.repository,
  });
  
  @override
  Future<Either<Failure, UserEntity>> call(String username) async {
    return repository.getUser(username: username);
  }
}