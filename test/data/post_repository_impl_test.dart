import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/data/repositories/repositories.dart';

import '../mocks/datasources/datasources.dart';
import '../mocks/factories/fake_post_factory.dart';

void main() {
  late PostRepositoryImpl sut;
  late PostDataSourceMock dataSource;

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
  });
}