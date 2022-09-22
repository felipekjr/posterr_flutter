import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/domain/helpers/helpers.dart';
import 'package:posterr_flutter/src/presentation/helpers/helpers.dart';
import 'package:posterr_flutter/src/presentation/presentation.dart';

import '../mocks/mocks.dart';

void main() {
  late ValueNotifierHomePresenter sut;
  List<UIState> states = [];
  // mocks
  late CreatePostMock createPostMock;
  late CreateQuoteMock createQuoteMock;
  late CreateRepostMock createRepostMock;
  late GetPostsMock getPostsMock;
  
  setUp(() {
    createPostMock = CreatePostMock();
    createQuoteMock = CreateQuoteMock();
    createRepostMock = CreateRepostMock();
    getPostsMock = GetPostsMock();

    sut = ValueNotifierHomePresenter(
      createPost: createPostMock,
      createQuote: createQuoteMock,
      createRepost: createRepostMock,
      getPosts: getPostsMock
    );
    sut.onInit();
    sut.state.addListener(() {
      states.add(sut.state.value);
    });
    
    getPostsMock.mockSuccess(FakePostFactory.makeFakePostList());
  });

  group('[getAllPosts]', () {
    test('Should call getPosts use case on getAllPosts method ', () async {
      states.clear();

      await sut.getAllPosts();

      verify(() => getPostsMock.call()).called(1);
    });

    test('Should set posts and emit correct states on getAllPosts method ', () async {
      states.clear();
      final fakeList = FakePostFactory.makeFakePostList();
      getPostsMock.mockSuccess(fakeList);

      await sut.getAllPosts();

      expect(sut.postsNotifier.value, fakeList);
      expect(states[0], const UILoadingState());
      expect(states[1], const UIInitialState());
    });

    test('Should emit correct states on getAllPosts fails', () async {
      states.clear();
      final failure = ServerFailure(faker.lorem.word());
      getPostsMock.mockError(failure);
      
      await sut.getAllPosts();

      expect(sut.postsNotifier.value, []);
      expect(states[0], const UILoadingState());
      expect(states[1], UIErrorState(failure.message));
    });
  });

  
}