
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/domain/helpers/helpers.dart';
import 'package:posterr_flutter/src/domain/usecases/usecases.dart';

import '../mocks/mocks.dart';

void main() {
  late CreateRepostImpl sut;
  late PostRepositoryMock postRepository;

  setUpAll(() {
    registerFallbackValue(FakePostFactory.makeFakePost());
  });

  setUp(() {
    postRepository = PostRepositoryMock();

    sut = CreateRepostImpl(
      repository: postRepository
    );

    postRepository.mockCreate(FakePostFactory.makeFakePost());
  });

  test('Should call repository with correct values', () async {
    final fakeAuthor = faker.guid.guid();
    final entity = FakePostFactory.makeFakePost();
    final repost = entity.copy(
      type: PostType.repost,
      author: fakeAuthor,
      childId: entity.id
    );
    
    await sut.call(post: entity, newAuthor: fakeAuthor);

    verify(() => postRepository.create(post: repost));
  });
}