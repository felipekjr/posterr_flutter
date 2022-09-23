import 'package:hive/hive.dart';


@HiveType(typeId: 0)
class LocalUserModal extends HiveObject {
  @HiveField(0)
  final String username;

  @HiveField(1)
  final DateTime creationDate;

  LocalUserModal(this.username, this.creationDate);
}