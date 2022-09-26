import '../../domain/entities/entities.dart';

abstract class PostModel {
  final String? id;
  final DateTime creationDate;
  final String? childId;

  PostModel(this.id, this.creationDate, this.childId);

  PostEntity toEntity();
}
