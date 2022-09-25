import 'package:get_it/get_it.dart';

import '../../../core/factories/repositories/repositories.dart';
import '../../../domain/usecases/usecases.dart';

GetPosts makeGetAllPosts() {
  return GetPostsImpl(repository: makePostRepository());
}

GetUserPosts makeGetUserPosts() {
  return GetUserPostsImpl(repository: makePostRepository());
}

CreatePost makeCreatePost() {
  return CreatePostImpl(
    repository: makePostRepository(),
    userCanPost: GetIt.I.get<UserCanPost>(),
  );
}

CreateQuote makeCreateQuot() {
  return CreateQuoteImpl(
    repository: makePostRepository(),
    userCanPost: GetIt.I.get<UserCanPost>(),
  );
}

CreateRepost makeCreateRepost() {
  return CreateRepostImpl(
    repository: makePostRepository(),
    userCanPost: GetIt.I.get<UserCanPost>(),
  );
}
