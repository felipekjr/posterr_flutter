
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/core/extensions/extensions.dart';
import 'package:posterr_flutter/src/domain/helpers/helpers.dart';
import 'package:posterr_flutter/src/domain/usecases/usecases.dart';

import '../mocks/mocks.dart';

void main() {
  late CreateQuoteImpl sut;
  late PostRepositoryMock postRepository;
  late UserCanPostMock userCanPostMock;

  setUpAll(() {
    registerFallbackValue(FakePostFactory.makeFakePost());
  });

  setUp(() {
    postRepository = PostRepositoryMock();
    userCanPostMock = UserCanPostMock();
    sut = CreateQuoteImpl(
      repository: postRepository,
      userCanPost: userCanPostMock
    );

    postRepository.mockCreate(FakePostFactory.makeFakePost());
    userCanPostMock.mockRes(true);
  });

  test('Should call repository with correct values', () async {
    final fakeText = faker.lorem.sentence();
    final fakeAuthor = FakeUserFactory.makeFakeUser();
    final entity = FakePostFactory.makeFakePost();
    final quotedEntity = entity.copy(
      type: PostType.quote,
      text: fakeText,
      author: fakeAuthor,
      childId: entity.id,
      child: entity,
      newPost: true
    );
    
    await sut.call(childPost: entity, text: fakeText, quoteAuthor: fakeAuthor);

    verify(() => postRepository.create(post: quotedEntity));
  });

  test('Shoud return validation error if user cant post', () async {
    userCanPostMock.mockRes(false);
    final fakeText = faker.lorem.sentence();
    final fakeAuthor = FakeUserFactory.makeFakeUser();
    final entity = FakePostFactory.makeFakePost();

    final res = await sut.call(childPost: entity, text: fakeText, quoteAuthor: fakeAuthor);

    expect(res.left(), const ValidationFailure('You have reached the daily post limit'));
  });
}