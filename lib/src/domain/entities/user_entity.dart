import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String username;
  final DateTime createdAt;

  const UserEntity({
    required this.username,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [username, createdAt];
}
