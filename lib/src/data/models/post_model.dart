import '../../domain/entities/entities.dart';

abstract class PostModel {
  final String? id;
  final DateTime creationDate;

  PostModel(this.id, this.creationDate);

  PostEntity toEntity();
}
