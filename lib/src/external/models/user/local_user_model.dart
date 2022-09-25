import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../../data/models/models.dart';
import '../../../domain/entities/user_entity.dart';

part 'local_user_model.g.dart';

@HiveType(typeId: 0)
class LocalUserModel extends HiveObject with EquatableMixin implements UserModel {
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
    return LocalUserModel(e.username, e.createdAt, id: e.id);
  }

  LocalUserModel copy({String? id}) {
    return LocalUserModel(
      username,
      creationDate,
      id: id ?? id,
    );
  }

  @override
  UserEntity toEntity() {
    return UserEntity(username: username, createdAt: creationDate, id: id);
  }

  @override
  List<Object?> get props => [username, creationDate, id];
}
