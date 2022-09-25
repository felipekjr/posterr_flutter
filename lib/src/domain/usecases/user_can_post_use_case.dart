// import 'package:dartz/dartz.dart';

// import '../entities/entities.dart';
// import '../helpers/helpers.dart';
// import '../repositories/repositories.dart';

// abstract class UserCanPost {
//   Future<Either<Failure, bool>> call(String username);
// }

// class UserCanPostImpl implements UserCanPost {
//   final PostRepository repository;

//   UserCanPostImpl({
//     required this.repository,
//   });
  
//   @override
//   Future<Either<Failure, bool>> call({required String userid}) async {
//     final userPosts = await repository.getByUser(id: id);
//   }
// }