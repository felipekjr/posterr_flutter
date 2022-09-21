import 'package:faker/faker.dart';
import 'package:posterr_flutter/src/domain/entities/entities.dart';
import 'package:posterr_flutter/src/domain/helpers/helpers.dart';

class FakePostFactory {
  static PostEntity makeFakePost({PostType? type}) => PostEntity(
    id: faker.guid.guid(), 
    createdAt: faker.date.dateTime(), 
    author: faker.guid.guid(), 
    type: type ?? random.element(PostType.values)
  );

  static List<PostEntity> makeFakePostList() => random.amount((i) => makeFakePost(), 5);
}