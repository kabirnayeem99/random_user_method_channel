import 'package:random_user_method_channel/src/domain/entities/user_entity.dart';

class UserListUiState {
  bool isLoading;
  List<User> users;

  UserListUiState({
    this.isLoading = false,
    this.users = const [],
  });

  UserListUiState copyWith({
    bool? isLoading,
    List<User>? users,
  }) {
    return UserListUiState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
    );
  }
}
