import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:posterr_flutter/src/external/external.dart';

import '../../../data/models/models.dart';
import '../../../domain/entities/post_entity.dart';
import '../../../domain/helpers/helpers.dart';

part 'local_post_model.g.dart';

@HiveType(typeId: 1)
class LocalPostModel extends HiveObject with EquatableMixin implements PostModel {
  @override
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final LocalUserModel author;

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
    required this.author,
    required this.creationDate,
    required this.type,
    this.text,
    this.childId,
    this.id,
  });

  LocalPostModel copy({
    String? id,
    String? type,
  }) {
    return LocalPostModel(
      id: id ?? this.id,
      type: type ?? this.type,
      author: author,
      creationDate: creationDate,
      text: text,
      childId: childId,
    );
  }

  @override
  PostEntity toEntity() {
    return PostEntity(
      id: id,
      createdAt: creationDate,
      author: author.toEntity(),
      type: _getType(type),
      text: text,
      childId: childId
    );
  }

  factory LocalPostModel.fromEntity(PostEntity e) {
    return LocalPostModel(
      author: LocalUserModel.fromEntity(e.author),
      creationDate: e.createdAt,
      type: _getTypeString(e.type),
      text: e.text,
      childId: e.childId
    );
  }

  static PostType _getType(String t) {
    return PostType.normal;
  }

  static String _getTypeString(PostType t) {
    return 'N';
  }

  @override
  List<Object?> get props => [author, id, text, childId, type, creationDate];
}
