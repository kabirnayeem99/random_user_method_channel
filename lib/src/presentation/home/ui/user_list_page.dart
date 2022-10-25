import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_user_method_channel/src/domain/entities/user_entity.dart';
import 'package:random_user_method_channel/src/presentation/home/controller/user_list_controller.dart';

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

          return isLoading
              ? const UserListLoadingBody()
              : UserListBody(userList: userList);
        },
      ),
    );
  }
}

class UserListBody extends StatelessWidget {
  const UserListBody({
    Key? key,
    required this.userList,
  }) : super(key: key);

  final List<User> userList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        final user = userList[position];
        return ListTile(
          leading: CachedNetworkImage(
            imageUrl: user.imageUrl,
            errorWidget: (_, __, ___) => const Icon(Icons.people),
            height: 40,
            width: 40,
          ),
          title: Text(user.name),
          subtitle: Text(user.fullAddress),
        );
      },
      itemCount: userList.length,
    );
  }
}

class UserListLoadingBody extends StatelessWidget {
  const UserListLoadingBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
