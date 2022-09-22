import 'package:posterr_flutter/src/domain/entities/entities.dart';
import 'package:posterr_flutter/src/domain/helpers/helpers.dart';

abstract class HomePresenter {
  Future<void> getAllPosts();
  Future<void> createNewPost();
}