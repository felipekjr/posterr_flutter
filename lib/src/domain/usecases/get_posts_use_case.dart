import 'package:posterr_flutter/src/domain/entities/entities.dart';

abstract class GetPostsUseCase {
  Future<List<PostEntity>> call();
}