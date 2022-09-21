
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/domain/usecases/usecases.dart';

import '../mocks/mocks.dart';

void main() {
  late CreatePostImpl sut;
  late PostRepositoryMock postRepository;

  setUpAll(() {
    registerFallbackValue(FakePostFactory.makeFakePost());
  });

  setUp(() {
    postRepository = PostRepositoryMock();

    sut = CreatePostImpl(
      repository: postRepository
    );

    postRepository.mockCreate(FakePostFactory.makeFakePost());
  });

  test('Should call repository with correct values', () async {
    final entity = FakePostFactory.makeFakePost();

    await sut.call(entity);

    verify(() => postRepository.create(post: entity));
  });
}