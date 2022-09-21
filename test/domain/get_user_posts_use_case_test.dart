
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/domain/usecases/usecases.dart';

import '../mocks/mocks.dart';

void main() {
  late GetUserPostsImpl sut;
  late PostRepositoryMock postRepository;

  setUpAll(() {
    registerFallbackValue(FakePostFactory.makeFakePost());
  });

  setUp(() {
    postRepository = PostRepositoryMock();

    sut = GetUserPostsImpl(
      repository: postRepository
    );

    postRepository.mockGetByUser(FakePostFactory.makeFakePostList());
  });

  test('Should call repository with correct values', () async {
    final fakeId = faker.guid.guid();
    await sut.call(userId: fakeId);

    verify(() => postRepository.getByUser(id: fakeId));
  });
}