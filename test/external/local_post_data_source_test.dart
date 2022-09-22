import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/external/external.dart';

import '../mocks/factories/fake_post_factory.dart';

class BoxMock<T> extends Mock implements Box<T> {}
class HiveMock extends Mock implements HiveInterface {
  void mockOpenBox(Box box) => when(() => openBox(any())).thenAnswer((_) async => Future.value(box));
}

void main() {
  late LocalPostDataSource sut;
  late HiveMock hiveMock;
  late BoxMock<LocalPostModel> fakeBox;

  setUpAll(() {
    registerFallbackValue(FakePostFactory.makeLocalModel());
  });

  setUp(() async {
    hiveMock = HiveMock();
    fakeBox = BoxMock();
    hiveMock.mockOpenBox(fakeBox);

    sut = LocalPostDataSource(box: fakeBox);
  });

  group('[Get all]', () {
    test('Should call hive box with correct values and return a list of post model', () async {
      final postsList = random.amount((i) => FakePostFactory.makeLocalModel(), 5);
      when(() => fakeBox.values).thenReturn(postsList);
     
      final res = await sut.getAll();

      verify(() => fakeBox.values);
      expect(res, postsList);
    });
  });

  group('[Get by author]', () {
    test('Should call hive box with correct values and return a list of post model', () async {
      final fakeId = faker.guid.guid();
      final postsList = random.amount((i) => FakePostFactory.makeLocalModel(
        authorId: i % 2 == 0 ? fakeId : null
      ), 5);
      when(() => fakeBox.values).thenReturn(postsList);
     
      final res = await sut.getByAuthorId(fakeId);

      verify(() => fakeBox.values);
      expect(res, postsList.where((e) => e.authorId == fakeId).toList());
    });
  });

  group('[Save]', () {
    test('Should call hive box with correct values and return correct model', () async {
      final fakeId = random.integer(100);
      final postEntity = FakePostFactory.makeFakePost();
      final postModel = LocalPostModel.fromEntity(postEntity);
      when(() => fakeBox.add(any())).thenAnswer((_) => Future.value(fakeId));

      final res = await sut.save(postEntity);
      
      verify(() => fakeBox.add(postModel));
      expect(res, postModel.copy(id: fakeId.toString()));
    });
  });
}