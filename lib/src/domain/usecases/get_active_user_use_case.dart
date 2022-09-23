import 'package:dartz/dartz.dart';
import 'package:posterr_flutter/src/domain/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/helpers.dart';
import '../repositories/repositories.dart';

abstract class GetActiveUser {
  Future<Either<Failure, UserEntity>> call();
}

class GetActiveUserImpl implements GetActiveUser {
  final SharedPreferences sharedPreferences;
  final UserRepository repository;

  GetActiveUserImpl({
    required this.sharedPreferences,
    required this.repository,
  });
  
  @override
  Future<Either<Failure, UserEntity>> call() async {
    final String? activeUsername = sharedPreferences.getString('activeUsername');
    return repository.getUser(username: activeUsername ?? '');
  }
}