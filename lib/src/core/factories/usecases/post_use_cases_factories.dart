import '../../../core/factories/repositories/repositories.dart';
import '../../../domain/usecases/usecases.dart';

GetPosts makeGetAllPosts() {
  return GetPostsImpl(repository: makePostRepository());
}

GetUserPosts makeGetUserPosts() {
  return GetUserPostsImpl(repository: makePostRepository());
}

CreatePost makeCreatePost() {
  return CreatePostImpl(repository: makePostRepository());
}

CreateQuote makeCreateQuot() {
  return CreateQuoteImpl(repository: makePostRepository());
}

CreateRepost makeCreateRepost() {
  return CreateRepostImpl(repository: makePostRepository());
}