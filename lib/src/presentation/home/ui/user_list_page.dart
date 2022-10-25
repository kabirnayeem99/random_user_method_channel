import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_user_method_channel/src/presentation/home/controller/user_list_controller.dart';
import 'package:random_user_method_channel/src/presentation/home/ui/widgets/user_list_body.dart';
import 'package:random_user_method_channel/src/presentation/home/ui/widgets/user_list_loading_body.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX(
        init: Get.put(UserListController()),
        builder: (controller) {
          final uiState = controller.uiState.value;
          final isLoading = uiState.isLoading;
          final userList = uiState.users;

          return AnimatedContainer(
            duration: 800.milliseconds,
            child: isLoading
                ? const UserListLoadingBody()
                : UserListBody(userList: userList),
          );
        },
      ),
    );
  }
}
