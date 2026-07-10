import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/login/login_view.dart';
import 'views/user/userlist/user_list_view.dart';
import 'res/routes/routes.dart';
import 'package:mvvm_login/views/welcome_screen/welcome_screen_view.dart';
import 'package:mvvm_login/view_models/user_prefrence/user_prefrence.dart';
import 'package:mvvm_login/view_models/controllers/user_provider/user_provider.dart';
import 'views/botttom_navigation/bottom_navigation_bar.dart';
import 'views/onboarding/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final userPreference = UserPreference();
  final isLoggedIn = await userPreference.isLoggedIn();
  final onboardingComplete = await userPreference.isOnboardingComplete();

  runApp(MyApp(isLoggedIn: isLoggedIn, onboardingComplete: onboardingComplete));
}

class MyApp extends StatelessWidget {

  final bool isLoggedIn;
  final bool onboardingComplete;
  const MyApp({super.key, required this.isLoggedIn, required this.onboardingComplete, });

  @override
  Widget build(BuildContext context) {
    Widget home;
    if (!onboardingComplete) {
      home = const OnboardingScreen();
    } else if (isLoggedIn) {
      home = const BottomNavScreen();
    } else {
      home = const LoginView();
    }
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: home,
      getPages: AppRoutes.appRoutes(),
    );
  }
}