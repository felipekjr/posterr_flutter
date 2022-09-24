import 'package:posterr_flutter/src/domain/entities/user_entity.dart';

abstract class UserModel {
  final String? id;
  final String username;
  final DateTime creationDate;

  UserModel(this.username, this.creationDate, {this.id});

  UserEntity toEntity();
}