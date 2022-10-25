import 'package:get/get.dart';
import 'package:random_user_method_channel/src/data/dataSources/method_data_source.dart';
import 'package:random_user_method_channel/src/data/dataSources/remote_data_source.dart';
import 'package:random_user_method_channel/src/data/dataSources/services/random_user_api_service.dart';

void initSources() {
  Get.lazyPut(() => MethodDataSource());
  Get.lazyPut(() => RandomUserApiService());
  Get.lazyPut(() => RemoteDataSource(Get.find()));
}
