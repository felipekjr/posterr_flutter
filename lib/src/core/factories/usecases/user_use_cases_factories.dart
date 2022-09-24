
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/factories/factories.dart';
import '../../../domain/usecases/get_active_user_use_case.dart';

Future<GetActiveUser> makeGetActiveUser() async => GetActiveUserImpl(
  sharedPreferences: await SharedPreferences.getInstance(), 
  repository: makeUserRepository()
);