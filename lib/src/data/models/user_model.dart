abstract class UserModel {
  final String? id;
  final String username;
  final DateTime creationDate;

  UserModel(this.username, this.creationDate, {this.id});
}