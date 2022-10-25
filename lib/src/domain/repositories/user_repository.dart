import 'package:random_user_method_channel/src/domain/entities/user_entity.dart';

abstract class UserRepository {
  Stream<List<User>> getUsers();
}