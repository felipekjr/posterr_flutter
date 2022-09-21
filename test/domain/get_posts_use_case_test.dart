
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/domain/usecases/usecases.dart';

import '../mocks/mocks.dart';

void main() {
  late GetPostsImpl sut;
  late PostRepositoryMock postRepository;

  setUpAll(() {
    registerFallbackValue(FakePostFactory.makeFakePost());
  });

  setUp(() {
    postRepository = PostRepositoryMock();

    sut = GetPostsImpl(
      repository: postRepository
    );

    postRepository.mockGetAll(FakePostFactory.makeFakePostList());
  });

  test('Should call repository with correct values', () async {
    await sut.call();

    verify(() => postRepository.getAll());
  });
}