import 'package:flutter/foundation.dart';
import 'package:random_user_method_channel/src/data/dataSources/services/random_user_api_service.dart';
import 'package:random_user_method_channel/src/data/dtos/user_api_response_dto.dart';
import 'package:random_user_method_channel/src/domain/entities/user_entity.dart';

class RemoteDataSource {
  final RandomUserApiService _apiService;

  RemoteDataSource(this._apiService);

  Future<List<User>> getUsers() async {
    final UserApiResponseDto usersDto = await _apiService.getRandomUsers();
    debugPrint(usersDto.toString());
    final users = await compute(convertApiDtoToUsers, usersDto);
    return users;
  }
}

List<User> convertApiDtoToUsers(UserApiResponseDto usersDto) {
  final users = usersDto.results
          ?.map((dto) => User(
                name: "${dto.name?.first ?? ""} ${dto.name?.last ?? ""}",
                email: dto.email ?? "",
                phone: dto.phone ?? "",
                imageUrl: dto.picture?.large?.contains("women") == true
                    ? ""
                    : dto.picture?.large ?? "",
                fullAddress: dto.location?.city ?? "",
                gender: dto.gender == "male" ? Gender.male : Gender.female,
              ))
          .toList() ??
      [];
  return users;
}
