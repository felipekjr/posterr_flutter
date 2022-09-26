import 'package:faker/faker.dart';
import 'package:posterr_flutter/src/domain/entities/entities.dart';
import 'package:posterr_flutter/src/external/models/models.dart';

class FakeUserFactory {
  static UserEntity makeFakeUser() => UserEntity(
        id: faker.guid.guid(),
        username: faker.lorem.word(),
        createdAt: faker.date.dateTime(),
      );
  static LocalUserModel makeFakeLocalUser() => LocalUserModel.fromEntity(
        FakeUserFactory.makeFakeUser(),
      );
}
