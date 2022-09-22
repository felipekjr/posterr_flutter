import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/core/extensions/extensions.dart';
import 'package:posterr_flutter/src/data/repositories/repositories.dart';
import 'package:posterr_flutter/src/domain/entities/entities.dart';
import 'package:posterr_flutter/src/domain/helpers/helpers.dart';

import '../mocks/datasources/datasources.dart';
import '../mocks/factories/fake_post_factory.dart';

void main() {
  late PostRepositoryImpl sut;
  late PostDataSourceMock dataSource;

  setUpAll(() {
    registerFallbackValue(FakePostFactory.makeFakePost());
  });

  setUp(() {
    dataSource = PostDataSourceMock();

    sut = PostRepositoryImpl(
      dataSource: dataSource
    );
  });

  group('Create', () {
    test('Should call datasource with correct values', () async {
      final fakePost = FakePostFactory.makeFakePost();

      await sut.create(post: fakePost);

      verify(() => dataSource.save(fakePost));
    });

    test('Should return correct value if success', () async {
      final fakePost = FakePostFactory.makeFakePost();
      final fakeModel = FakePostFactory.makeFakeModel();
      (fakeModel as PostModelMock).mockToEntity(fakePost);
      dataSource.mockCreate(fakeModel);

      final res = await sut.create(post: fakePost);

      expect(res.isRight(), true);
      expect(res.right(), fakePost);
    });

    test('Should emit correct failure if fails', () async {
      dataSource.mockCreateError(Exception());

      final res = await sut.create(post: FakePostFactory.makeFakePost());

      expect(res.isLeft(), true);
      expect(res.left(), const UnexpectedFailure('Unexpected error while creating the post'));
    });
  });
}