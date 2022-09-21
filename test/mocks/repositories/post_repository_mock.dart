import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/domain/entities/entities.dart';
import 'package:posterr_flutter/src/domain/repositories/repositories.dart';

class PostRepositoryMock extends Mock implements PostRepository {
  void mockCreate(PostEntity e) => when(() => create(post: any(named: 'post'))).thenAnswer((_) => Future.value(Right(e)));
}
