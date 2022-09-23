import 'package:equatable/equatable.dart';

import '../helpers/helpers.dart';

class PostEntity extends Equatable {
  final String? id;
  final DateTime createdAt;
  final String author;
  final PostType type;
  final String? text;
  final String? childId;

  const PostEntity({
    required this.createdAt,
    required this.author,
    required this.type,
    this.id,
    this.text,
    this.childId
  });

  PostEntity copy({
    String? id,
    DateTime? createdAt,
    String? author,
    PostType? type,
    String? text,
    String? childId,
    bool newPost = false
  }) => PostEntity(
    id: newPost ? null : id ?? this.id, 
    author: author ?? this.author, 
    createdAt: createdAt ?? this.createdAt, 
    type: type ?? this.type,
    text: text ?? this.text,
    childId: childId ?? this.childId
  );

  @override
  List<Object?> get props => [id, createdAt, author, type, text, childId];
}

