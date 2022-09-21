import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/domain/entities/entities.dart';
import 'package:posterr_flutter/src/domain/repositories/repositories.dart';

class PostRepositoryMock extends Mock implements PostRepository {
  void mockCreate(PostEntity e) => when(() => create(post: any(named: 'post'))).thenAnswer((_) => Future.value(Right(e)));
  void mockGetAll(List<PostEntity> list) => when(() => getAll()).thenAnswer((_) => Future.value(Right(list)));
  void mockGetByUser(List<PostEntity> list) => when(() => getByUser(id: any(named: 'id'))).thenAnswer((_) => Future.value(Right(list)));
}
