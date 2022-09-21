import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final String id;
  final DateTime createdAt;
  final String author;
  final PostType type;
  final String? text;
  final String? childId;

  const PostEntity({
    required this.id,
    required this.createdAt,
    required this.author,
    required this.type,
    this.text,
    this.childId
  });

  @override
  List<Object?> get props => [id, createdAt, author, type, text, childId];
}

enum PostType {
  normal,
  repost,
  quote
}