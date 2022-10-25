import 'package:flutter/services.dart';
import 'package:random_user_method_channel/src/data/dataSources/method_data_source.dart';
import 'package:random_user_method_channel/src/data/dataSources/remote_data_source.dart';
import 'package:random_user_method_channel/src/domain/entities/user_entity.dart';
import 'package:random_user_method_channel/src/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final MethodDataSource _methodDataSource;
  final RemoteDataSource _remoteDataSource;

  UserRepositoryImpl(this._methodDataSource, this._remoteDataSource);

  final List<User> _inMemoryUsers = List.empty(growable: true);

  @override
  Stream<List<User>> getUsers() async* {
    try {
      if (_inMemoryUsers.isNotEmpty) yield _inMemoryUsers;
      final users = await _methodDataSource.getUsers();
      _inMemoryUsers.addAll(users);
      if (_inMemoryUsers.isNotEmpty) yield _inMemoryUsers;
    } on MissingPluginException catch (_) {
      final users = await _remoteDataSource.getUsers();
      _inMemoryUsers.addAll(users);
      if (_inMemoryUsers.isNotEmpty) yield _inMemoryUsers;
    } on PlatformException catch (_) {
      final users = await _remoteDataSource.getUsers();
      _inMemoryUsers.addAll(users);
      if (_inMemoryUsers.isNotEmpty) yield _inMemoryUsers;
    } on Exception catch (e) {
      if (_inMemoryUsers.isNotEmpty) yield _inMemoryUsers;
    }
  }
}
