import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/login/login_view.dart';
import 'views/user/userlist/user_list_view.dart';
import 'res/routes/routes.dart';
import 'package:mvvm_login/views/welcome_screen/welcome_screen_view.dart';
import 'package:mvvm_login/view_models/user_prefrence/user_prefrence.dart';
import 'views/botttom_navigation/bottom_navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final userPreference = UserPreference();
  final isLoggedIn = await userPreference.isLoggedIn();

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isLoggedIn ? const BottomNavScreen() : const LoginView(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}