import 'package:hive/hive.dart';

import '../../../data/data_sources/data_sources.dart';
import '../../../domain/entities/entities.dart';
import '../../models/models.dart';

class LocalUserDataSource implements UserDataSource<LocalUserModel> {
  final Box<LocalUserModel> box;

  LocalUserDataSource({required this.box});

  @override
  Future<LocalUserModel> save(UserEntity user) async {
    if (user.isValid()) {
      final userModel = LocalUserModel.fromEntity(user);
      final id = await box.add(userModel);
      final userWithId = userModel.copy(id: id.toString());
      await box.put(id, userWithId);
      return userWithId;
    } else {
      throw Exception('Invalid username');
    }
   
  }

  @override
  Future<List<LocalUserModel>> getAll() async {
    return box.values.toList();
  }

  @override
  Future<LocalUserModel> getByName(String username) async {
    return box.values.firstWhere((e) => e.username == username);
  }
}
