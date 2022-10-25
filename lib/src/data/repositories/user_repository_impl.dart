import 'package:random_user_method_channel/src/data/dataSources/method_data_source.dart';
import 'package:random_user_method_channel/src/domain/entities/user_entity.dart';
import 'package:random_user_method_channel/src/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final MethodDataSource _methodDataSource = MethodDataSource();

  final List<User> _inMemoryUsers = List.empty(growable: true);

  @override
  Stream<List<User>> getUsers() async* {
    if (_inMemoryUsers.isNotEmpty) yield _inMemoryUsers;
    final users = await _methodDataSource.getUsers();
    _inMemoryUsers.addAll(users);
    if (_inMemoryUsers.isNotEmpty) yield _inMemoryUsers;
  }
}
