import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:random_user_method_channel/src/data/dtos/user_api_response_dto.dart';

class RandomUserApiService {
  final Dio _dio = Dio();

  Future<UserApiResponseDto> getRandomUsers() async {
    final response = await _dio.get("https://randomuser.me/api/?results=10");
    if (response.statusCode != 200) throw Exception("Failed to find users");
    final dto = UserApiResponseDto.fromJson(response.data);
    return dto;
  }
}

Future<Map<String, dynamic>> jsonDecodeList(dynamic object) async {
  return jsonDecode(object);
}
