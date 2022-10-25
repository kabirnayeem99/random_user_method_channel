import 'package:flutter/material.dart';
import 'package:random_user_method_channel/src/core/di/init_services.dart';
import 'package:random_user_method_channel/src/presentation/home/ui/user_list_page.dart';

void main() async {
  initServices();
  runApp(const RandomUserApp());
}

class RandomUserApp extends StatelessWidget {
  const RandomUserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const UserListPage(),
    );
  }
}
