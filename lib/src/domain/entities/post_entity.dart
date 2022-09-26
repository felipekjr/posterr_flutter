import 'package:equatable/equatable.dart';

import './user_entity.dart';
import '../helpers/helpers.dart';

class PostEntity extends Equatable {
  final String? id;
  final DateTime createdAt;
  final UserEntity author;
  final PostType type;
  final String? text;
  final String? childId;

  final PostEntity? child;

  const PostEntity({
    required this.createdAt,
    required this.author,
    required this.type,
    this.id,
    this.text,
    this.childId,
    this.child
  });

  PostEntity copy({
    String? id,
    DateTime? createdAt,
    UserEntity? author,
    PostType? type,
    String? text,
    String? childId,
    PostEntity? child,
    bool newPost = false
  }) => PostEntity(
    id: newPost ? null : id ?? this.id, 
    author: author ?? this.author, 
    createdAt: createdAt ?? this.createdAt, 
    type: type ?? this.type,
    text: text ?? this.text,
    childId: childId ?? this.childId,
    child: child ?? this.child
  );

  @override
  List<Object?> get props => [id, createdAt, author, type, text, childId, child];
}

