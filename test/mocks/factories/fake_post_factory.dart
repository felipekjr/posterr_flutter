import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/data/models/post_model.dart';
import 'package:posterr_flutter/src/domain/entities/entities.dart';
import 'package:posterr_flutter/src/domain/helpers/helpers.dart';

class PostEntityMock extends Mock implements PostEntity {}
class PostModelMock extends Mock implements PostModel {
  void mockToEntity(PostEntity res) => when(() => toEntity()).thenReturn(res);
}

class FakePostFactory {
  static PostEntity makeFakePost({PostType? type}) => PostEntity(
    id: faker.guid.guid(), 
    createdAt: faker.date.dateTime(), 
    author: faker.guid.guid(), 
    type: type ?? random.element(PostType.values)
  );

  static List<PostEntity> makeFakePostList() => random.amount((i) => makeFakePost(), 5);

  static PostModel makeFakeModel() => PostModelMock();
}