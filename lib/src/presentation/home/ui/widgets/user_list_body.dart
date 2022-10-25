import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loadmore/loadmore.dart';
import 'package:random_user_method_channel/src/domain/entities/user_entity.dart';
import 'package:random_user_method_channel/src/presentation/home/controller/user_list_controller.dart';
import 'package:random_user_method_channel/src/presentation/home/ui/widgets/user_avatar_network_image.dart';

class UserListBody extends StatelessWidget {
  UserListBody({
    Key? key,
    required this.userList,
  }) : super(key: key);

  final List<User> userList;

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    debugPrint(size.toString());
    return LoadMore(
      onLoadMore: () async {
        if (userList.length % 10 == 0) {
          await Future.delayed((userList.length / 10 * 1000).milliseconds);
          Get.find<UserListController>().fetchUserList();
          return true;
        } else {
          return false;
        }
      },
      isFinish: userList.length >= 60,
      textBuilder: (status) => status == LoadMoreStatus.loading
          ? "Loading more users..."
          : "No more users",
      child: ListView.builder(
        itemBuilder: (context, position) {
          final user = userList[position];
          return ListTile(
            key: Key(user.imageUrl),
            leading: UserAvatarNetworkImage(imageUrl: user.imageUrl),
            title: Text(user.name),
            subtitle: Text(user.fullAddress),
          );
        },
        itemCount: userList.length,
      ),
    );
  }
}
