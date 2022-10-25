import 'package:get/get.dart';
import 'package:random_user_method_channel/src/data/dataSources/method_data_source.dart';

void initSources() {
  Get.lazyPut(() => MethodDataSource());
}
