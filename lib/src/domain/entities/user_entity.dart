import 'package:equatable/equatable.dart';

import '../../core/validators/validators.dart';

class UserEntity extends Equatable {
  final String? id;
  final String username;
  final DateTime createdAt;

  const UserEntity({
    required this.username,
    required this.createdAt,
    this.id,
  });

  UserEntity copy({
    String? id,
  }) =>
      UserEntity(
        username: username,
        createdAt: createdAt,
        id: id ?? this.id,
      );

  bool isValid() => username.length <= 14 && StringValidators.hasNoSpecialCharacteres(username);

  @override
  List<Object?> get props => [username, createdAt, id];
}
