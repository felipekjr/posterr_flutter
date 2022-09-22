import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:posterr_flutter/src/domain/entities/entities.dart';
import 'package:posterr_flutter/src/domain/helpers/helpers.dart';
import 'package:posterr_flutter/src/domain/usecases/usecases.dart';

class GetPostsMock extends Mock implements GetPosts {
  void mockSuccess(List<PostEntity> list) => 
    when(() => call()).thenAnswer((_) => Future.value(Right(list)));

  void mockError(Failure f) => 
    when(() => call()).thenAnswer((_) => Future.value(Left(f)));
}