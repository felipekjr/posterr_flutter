
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/core/extensions/extensions.dart';
import 'package:posterr_flutter/src/domain/helpers/helpers.dart';
import 'package:posterr_flutter/src/domain/usecases/usecases.dart';

import '../mocks/mocks.dart';
import '../mocks/usecases/use_can_post_mock.dart';

void main() {
  late CreatePostImpl sut;
  late PostRepositoryMock postRepository;
  late UserCanPostMock userCanPostMock;
  setUpAll(() {
    registerFallbackValue(FakePostFactory.makeFakePost());
  });

  setUp(() {
    postRepository = PostRepositoryMock();
    userCanPostMock = UserCanPostMock();

    sut = CreatePostImpl(
      repository: postRepository,
      userCanPost: userCanPostMock
    );

    postRepository.mockCreate(FakePostFactory.makeFakePost());
    userCanPostMock.mockRes(true);
  });

  test('Should call repository with correct values', () async {
    final entity = FakePostFactory.makeFakePost();

    await sut.call(entity);

    verify(() => postRepository.create(post: entity));
  });

  test('Shoud return validation error if user cant post', () async {
    userCanPostMock.mockRes(false);
    final entity = FakePostFactory.makeFakePost();

    final res = await sut.call(entity);

    expect(res.left(), const ValidationFailure('You have reached the daily post limit'));
  });
}