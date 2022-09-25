import '../../core/extensions/extensions.dart';
import '../repositories/repositories.dart';

abstract class UserCanPost {
  Future<bool> call({required String userId});
}

class UserCanPostImpl implements UserCanPost {
  final PostRepository repository;

  UserCanPostImpl({
    required this.repository,
  });

  @override
  Future<bool> call({required String userId}) async {
    final userPosts = await repository.getByUser(id: userId);
    final dailyPosts = userPosts
        .right()
        .where((e) => e.createdAt.difference(DateTime.now()).inDays == 0);
    return dailyPosts.length < 5;
  }
}
