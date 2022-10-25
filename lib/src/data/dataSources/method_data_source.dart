import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:random_user_method_channel/src/data/dtos/user_method_dto.dart';
import 'package:random_user_method_channel/src/domain/entities/user_entity.dart';

const randomUserChannel = "io.github.kabirnayeem99/randomUser";

class MethodDataSource {
  static const _platformMethodChannel = MethodChannel(randomUserChannel);

  Future<List<User>> getUsers() async {
    final String result =
        await _platformMethodChannel.invokeMethod("get_user_task");
    final userMap = json.decode(result) as List;
    final userDtos = userMap.map((e) => UserMethodDto.fromJson(e));
    debugPrint(userDtos.toString());
    final users = userDtos.map((dto) => User(
          name: dto.name ?? "",
          email: dto.email ?? "",
          phone: dto.phone ?? "",
          imageUrl: dto.imageUrl ?? "",
          fullAddress: dto.fullAddress ?? "",
          gender: dto.gender == "Male" ? Gender.male : Gender.female,
        )).toList();
    return users;
  }
}