import 'package:get/get.dart';
import 'package:random_user_method_channel/src/data/repositories/user_repository_impl.dart';
import 'package:random_user_method_channel/src/domain/repositories/user_repository.dart';

void initRepositories() {
  Get.lazyPut<UserRepository>(() => UserRepositoryImpl(Get.find(), Get.find()));
}
