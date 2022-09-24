import 'package:hive/hive.dart';

import '../../../data/data_sources/data_sources.dart';
import '../../../domain/entities/entities.dart';
import '../../models/models.dart';

class LocalUserDataSource implements UserDataSource<LocalUserModel> {
  final Box<LocalUserModel> box;

  LocalUserDataSource({required this.box});

  @override
  Future<LocalUserModel> save(UserEntity user) async {
    final userModel = LocalUserModel.fromEntity(user);
    final id = await box.add(userModel);
    return userModel.copy(id: id.toString());
  }

  @override
  Future<List<LocalUserModel>> getAll() async {
    return box.values.toList();
  }

  @override
  Future<LocalUserModel> getByName(String name) async {
    return box.values.firstWhere((e) => e.username == name);
  }
}
