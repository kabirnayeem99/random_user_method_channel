import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return LoadMore(
      onLoadMore: () async {
        if (userList.length % 10 == 0) {
          await Future.delayed((userList.length / 10 * 560).milliseconds);
          Get.find<UserListController>().fetchUserList();
          return true;
        } else {
          return false;
        }
      },
      isFinish: userList.length >= 60,
      textBuilder: (status) => status == LoadMoreStatus.loading ? "" : "end.",
      child: ListView.builder(
        itemBuilder: (context, position) {
          final user = userList[position];
          return SlideInLeft(
            duration: ((position % 10) * 73).milliseconds,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.sp),
              child: Card(
                color: Theme.of(context).primaryColor.withAlpha(60),
                elevation: 1.sp,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.sp)),
                child: ListTile(
                  contentPadding: EdgeInsets.all(12.sp),
                  key: Key(user.imageUrl),
                  leading: UserAvatarNetworkImage(imageUrl: user.imageUrl),
                  title: Text(user.name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                      )),
                  subtitle: Text(user.fullAddress,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          );
        },
        itemCount: userList.length,
      ),
    );
  }
}
