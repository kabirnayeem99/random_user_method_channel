import 'package:get/get.dart';
import 'package:random_user_method_channel/src/domain/repositories/user_repository.dart';
import 'package:random_user_method_channel/src/presentation/home/ui_states/user_list_ui_state.dart';

class UserListController extends GetxController {
  final UserRepository userRepository = Get.find();

  final uiState = UserListUiState().obs;

  @override
  void onInit() async {
    super.onInit();
    await fetchUserList();
  }

  Future<void> fetchUserList() async {
    loading();
    userRepository.getUsers().listen((users) {
      uiState.value = uiState.value.copyWith(users: users);
      unloading();
    });
  }

  void loading() {
    uiState.value = uiState.value.copyWith(isLoading: true);
  }

  void unloading() {
    uiState.value = uiState.value.copyWith(isLoading: false);
  }
}
