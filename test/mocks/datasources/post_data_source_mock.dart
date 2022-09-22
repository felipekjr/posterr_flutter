import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/data/data_sources/data_sources.dart';
import 'package:posterr_flutter/src/data/models/post_model.dart';

class PostDataSourceMock<T extends PostModel> extends Mock implements PostDataSource<T> {
  void mockCreate(T model) => when(() => save(any())).thenAnswer((_) => Future.value(model));
  void mockCreateError(Exception ex) => when(() => save(any())).thenThrow(ex);

  void mockGetAll(List<T> list) => when(() => getAll()).thenAnswer((_) => Future.value(list));
  void mockGetAllError(Exception ex) => when(() => getAll()).thenThrow(ex);

  void mockGetByAuthorId(List<T> list) => when(() => getByAuthorId(any())).thenAnswer((_) => Future.value(list));
  void mockGetByAuthorIdError(Exception ex) => when(() => getByAuthorId(any())).thenThrow(ex);
}