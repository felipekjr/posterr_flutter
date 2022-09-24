import 'package:hive/hive.dart';


@HiveType(typeId: 0)
class LocalUserModel extends HiveObject {
  @HiveField(0)
  final String username;

  @HiveField(1)
  final DateTime creationDate;

  LocalUserModel(this.username, this.creationDate);
}