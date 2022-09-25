import 'package:equatable/equatable.dart';

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

  @override
  List<Object?> get props => [username, createdAt, id];
}
