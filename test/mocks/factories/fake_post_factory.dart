import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/data/models/post_model.dart';
import 'package:posterr_flutter/src/domain/entities/entities.dart';
import 'package:posterr_flutter/src/domain/helpers/helpers.dart';
import 'package:posterr_flutter/src/external/external.dart';

class PostEntityMock extends Mock implements PostEntity {}
class LocalPostModelMock extends Mock implements LocalPostModel {
  @override
  final String authorId;

  LocalPostModelMock(this.authorId);

  factory LocalPostModelMock.fromEntity(PostEntity e) => LocalPostModelMock(e.author);

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
  
  static LocalPostModel makeLocalModel({String? authorId}) => LocalPostModel(
    authorId: authorId ?? faker.guid.guid(),
    creationDate: faker.date.dateTime(),
    id: faker.guid.guid(), 
    type: random.element(['N', 'R', 'Q'])
  );
  static LocalPostModelMock makeLocalModelMock({String? authorId}) => LocalPostModelMock(
    authorId ?? faker.guid.guid(),
  );
}