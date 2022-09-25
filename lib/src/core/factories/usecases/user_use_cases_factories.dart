
import '../../../core/factories/factories.dart';
import '../../../domain/usecases/usecases.dart';

GetUsers makeGetUsers() => GetUsersImpl(
  repository: makeUserRepository()
);

GetUser makeGetUser() => GetUserImpl(
  repository: makeUserRepository()
);

UserCanPost makeUserCanPost() => UserCanPostImpl(
  repository: makePostRepository()
);