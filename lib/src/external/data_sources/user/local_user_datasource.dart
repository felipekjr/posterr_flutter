import 'package:hive/hive.dart';
import 'package:posterr_flutter/src/domain/entities/user_entity.dart';

import '../../../data/data_sources/data_sources.dart';
import '../../models/models.dart';

class LocalUserDataSource implements UserDataSource<LocalUserModel> {
  final Box<LocalUserModel> box;

  LocalUserDataSource({required this.box});
  
  @override
  Future<LocalUserModel> getActive(String username) {
    // TODO: implement getActive
    throw UnimplementedError();
  }
  
  @override
  Future<LocalUserModel> save(UserEntity user) async {
    final userModel = LocalUserModel.fromEntity(user);
    final id = await box.add(userModel);
    return userModel.copy(id: id.toString());
  }
  
  @override
  Future<LocalUserModel> setActive(String username) {
    // TODO: implement setActive
    throw UnimplementedError();
  }
}