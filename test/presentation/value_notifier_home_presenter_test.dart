import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/domain/helpers/helpers.dart';
import 'package:posterr_flutter/src/presentation/helpers/helpers.dart';
import 'package:posterr_flutter/src/presentation/presentation.dart';

import '../mocks/mocks.dart';
import '../mocks/usecases/get_active_user_mock.dart';

void main() {
  late ValueNotifierHomePresenter sut;
  List<UIState> states = [];

  // mocks
  late CreatePostMock createPostMock;
  late CreateQuoteMock createQuoteMock;
  late CreateRepostMock createRepostMock;
  late GetPostsMock getPostsMock;
  late GetActiveUserMock getActiveUserMock;

  setUpAll(() {
    registerFallbackValue(FakePostFactory.makeFakePost());
  });

  setUp(() {
    createPostMock = CreatePostMock();
    createQuoteMock = CreateQuoteMock();
    createRepostMock = CreateRepostMock();
    getPostsMock = GetPostsMock();
    getActiveUserMock = GetActiveUserMock();

    sut = ValueNotifierHomePresenter(
      createPost: createPostMock,
      createQuote: createQuoteMock,
      createRepost: createRepostMock,
      getPosts: getPostsMock,
      getActiveUser: getActiveUserMock,
    );
    sut.onInit();
    sut.state.addListener(() {
      states.add(sut.state.value);
    });

    getPostsMock.mockSuccess(FakePostFactory.makeFakePostList());
  });

  group('[makeNewPost]', () {
    test('Should call createPost use case when type is normal on makeNewPost',
        () async {
      final fakeUser = FakeUserFactory.makeFakeUser();
      getActiveUserMock.mockSuccess(fakeUser);
      var postEntity = FakePostFactory.makeFakePost();
      await sut.makeNewPost(postEntity, postType: PostType.normal);
      verify(
        () => createPostMock.call(
          postEntity.copy(
            author: fakeUser.username,
          ),
        ),
      ).called(1);
    });

    test('Should call createRepost use case when type is repost on makeNewPost',
        () async {
      final fakeUser = FakeUserFactory.makeFakeUser();
      getActiveUserMock.mockSuccess(fakeUser);
      var postEntity = FakePostFactory.makeFakePost();
      await sut.makeNewPost(postEntity, postType: PostType.repost);
      verify(
        () => createRepostMock.call(
          post: postEntity.copy(
            author: fakeUser.username,
          ),
          newAuthor: fakeUser.username,
        ),
      ).called(1);
    });

    test('Should call createQuote use case when type is quote on makeNewPost',
        () async {
      final fakeUser = FakeUserFactory.makeFakeUser();
      getActiveUserMock.mockSuccess(fakeUser);
      var postEntity = FakePostFactory.makeFakePost();
      final fakeQuote = faker.lorem.sentence();
      await sut.makeNewPost(
        postEntity,
        postType: PostType.quote,
        quote: fakeQuote,
      );
      verify(
        () => createQuoteMock.call(
          post: postEntity.copy(author: fakeUser.username),
          quoteAuthor: fakeUser.username,
          text: fakeQuote,
        ),
      ).called(1);
    });
  });

  group('[getAllPosts]', () {
    test('Should call getPosts use case on getAllPosts method ', () async {
      states.clear();

      await sut.getAllPosts();

      verify(() => getPostsMock.call()).called(1);
    });

    test('Should set posts and emit correct states on getAllPosts method ',
        () async {
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
