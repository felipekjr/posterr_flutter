import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/data/data_sources/data_sources.dart';
import 'package:posterr_flutter/src/data/models/post_model.dart';

class PostDataSourceMock extends Mock implements PostDataSource {
  void mockCreate(PostModel model) => when(() => save(any())).thenAnswer((_) => Future.value(model));
  void mockCreateError(Exception ex) => when(() => save(any())).thenThrow(ex);

  void mockGetAll(List<PostModel> list) => when(() => getAll()).thenAnswer((_) => Future.value(list));
  void mockGetAllError(Exception ex) => when(() => getAll()).thenThrow(ex);
}