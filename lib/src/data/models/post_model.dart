import 'package:equatable/equatable.dart';
import 'package:posterr_flutter/src/domain/entities/entities.dart';

abstract class PostModel {
  final String? id;
  final String authorId;
  final DateTime creationDate;

  PostModel(this.id, this.authorId, this.creationDate);

  PostEntity toEntity();
}
