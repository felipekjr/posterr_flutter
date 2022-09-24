import 'package:hive/hive.dart';
import 'package:posterr_flutter/src/data/models/models.dart';
import 'package:posterr_flutter/src/domain/entities/user_entity.dart';

part 'local_user_model.g.dart';

@HiveType(typeId: 0)
class LocalUserModel extends HiveObject implements UserModel {
  @override
  @HiveField(0)
  final String? id;

  @HiveField(1)
  @override
  final String username;

  @HiveField(2)
  @override
  final DateTime creationDate;

  LocalUserModel(this.username, this.creationDate, {this.id});

  factory LocalUserModel.fromEntity(UserEntity e) {
    return LocalUserModel(
      e.username, e.createdAt
    );
  }

  LocalUserModel copy({
    String? id
  }) => LocalUserModel(username, creationDate, id: id ?? id);
}