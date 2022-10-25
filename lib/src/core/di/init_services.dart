import 'package:random_user_method_channel/src/core/di/init_repositories.dart';
import 'package:random_user_method_channel/src/core/di/init_sources.dart';

Future<void> initServices() async {
  initSources();
  initRepositories();
}
