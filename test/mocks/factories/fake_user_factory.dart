import 'package:faker/faker.dart';
import 'package:posterr_flutter/src/domain/entities/entities.dart';

class FakeUserFactory {
  static UserEntity makeFakeUser() => UserEntity(
        username: faker.lorem.word(),
        createdAt: faker.date.dateTime(),
      );
}
