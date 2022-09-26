import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/data/models/post_model.dart';
import 'package:posterr_flutter/src/domain/entities/entities.dart';
import 'package:posterr_flutter/src/domain/helpers/helpers.dart';
import 'package:posterr_flutter/src/external/external.dart';

import 'fake_user_factory.dart';

class PostEntityMock extends Mock implements PostEntity {}

class LocalPostModelMock extends Mock implements LocalPostModel {
  @override
  final LocalUserModel author;
  @override
  final DateTime creationDate;

  LocalPostModelMock(this.author, this.creationDate);

  factory LocalPostModelMock.fromEntity(PostEntity e) => LocalPostModelMock(
        LocalUserModel.fromEntity(e.author), e.createdAt
      );

  void mockToEntity(PostEntity res) => when(() => toEntity()).thenReturn(res);
}

class FakePostFactory {
  static PostEntity makeFakePost({PostType? type}) => PostEntity(
      id: faker.guid.guid(),
      createdAt: faker.date.dateTime(),
      author: FakeUserFactory.makeFakeUser(),
      type: type ?? random.element(PostType.values));

  static List<PostEntity> makeFakePostList() =>
      random.amount((i) => makeFakePost(), 5);

  static LocalPostModel makeLocalModel({LocalUserModel? author}) =>
      LocalPostModel(
          author: author ?? FakeUserFactory.makeFakeLocalUser(),
          creationDate: faker.date.dateTime(),
          id: faker.guid.guid(),
          type: random.element(['N', 'R', 'Q']));

  static LocalPostModelMock makeLocalModelMock({String? authorId}) =>
      LocalPostModelMock(FakeUserFactory.makeFakeLocalUser(), DateTime.now());
}
