import 'package:random_user_method_channel/src/data/dataSources/method_data_source.dart';
import 'package:random_user_method_channel/src/domain/entities/user_entity.dart';
import 'package:random_user_method_channel/src/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final MethodDataSource _methodDataSource = MethodDataSource();

  List<User> _inMemoryUsers = List.empty();

  @override
  Stream<List<User>> getUsers() async* {
    yield _inMemoryUsers;
    final users = await _methodDataSource.getUsers();
    _inMemoryUsers = users;
    yield users;
  }
}
