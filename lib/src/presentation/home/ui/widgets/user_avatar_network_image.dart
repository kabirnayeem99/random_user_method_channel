import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAvatarNetworkImage extends StatelessWidget {
  const UserAvatarNetworkImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.sp),
      child: Container(
        color: Theme.of(context).primaryColor.withOpacity(0.5),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imageUrl,
          errorWidget: (_, __, ___) => Icon(
            Icons.people,
            color: Theme.of(context).primaryColor.withOpacity(0.9),
          ),
          height: 40.sp,
          width: 40.sp,
        ),
      ),
    );
  }
}
