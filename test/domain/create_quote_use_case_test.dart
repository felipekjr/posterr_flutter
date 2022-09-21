
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/domain/helpers/helpers.dart';
import 'package:posterr_flutter/src/domain/usecases/usecases.dart';

import '../mocks/mocks.dart';

void main() {
  late CreateQuoteImpl sut;
  late PostRepositoryMock postRepository;

  setUpAll(() {
    registerFallbackValue(FakePostFactory.makeFakePost());
  });

  setUp(() {
    postRepository = PostRepositoryMock();

    sut = CreateQuoteImpl(
      repository: postRepository
    );

    postRepository.mockCreate(FakePostFactory.makeFakePost());
  });

  test('Should call repository with correct values', () async {
    final fakeText = faker.lorem.sentence();
    final fakeAuthor = faker.guid.guid();
    final entity = FakePostFactory.makeFakePost();
    final quotedEntity = entity.copy(
      type: PostType.quote,
      text: fakeText,
      author: fakeAuthor,
      childId: entity.id
    );
    
    await sut.call(post: entity, text: fakeText, quoteAuthor: fakeAuthor);

    verify(() => postRepository.create(post: quotedEntity));
  });
}