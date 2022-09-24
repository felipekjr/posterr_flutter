import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../../data/models/models.dart';
import '../../../domain/entities/post_entity.dart';
import '../../../domain/helpers/helpers.dart';

part 'local_post_model.g.dart';

@HiveType(typeId: 1)
class LocalPostModel extends HiveObject with EquatableMixin implements PostModel {
  @override
  @HiveField(0)
  final String? id;

  @override
  @HiveField(1)
  final String authorId;

  @override
  @HiveField(2)
  final DateTime creationDate;

  @HiveField(3)
  final String type;

  @HiveField(4)
  final String? text;

  @HiveField(5)
  final String? childId;

  LocalPostModel({
    required this.authorId,
    required this.creationDate,
    required this.type,
    this.text,
    this.childId,
    this.id,
  });

  LocalPostModel copy({
    String? id,
    String? authorId,
    DateTime? creationDate,
    String? type,
  }) {
    return LocalPostModel(
      id: id ?? this.id,
      authorId: authorId ?? this.authorId,
      creationDate: creationDate ?? this.creationDate,
      type: type ?? this.type,
    );
  }

  @override
  PostEntity toEntity() {
    return PostEntity(
      id: id,
      createdAt: creationDate,
      author: authorId,
      type: _getType(type),
    );
  }

  factory LocalPostModel.fromEntity(PostEntity e) {
    return LocalPostModel(
      authorId: e.author,
      creationDate: e.createdAt,
      type: _getTypeString(e.type),
      text: e.text
    );
  }

  static PostType _getType(String t) {
    return PostType.normal;
  }

  static String _getTypeString(PostType t) {
    return 'N';
  }

  @override
  List<Object?> get props => [authorId, id];
}
