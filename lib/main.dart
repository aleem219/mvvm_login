import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/login/login_view.dart';
import 'views/user/user_list.dart';
import 'res/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginView(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}