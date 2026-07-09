import 'package:get/get.dart';
import 'package:mvvm_login/views/botttom_navigation/bottom_navigation_bar.dart';
import 'package:mvvm_login/views/login/login_view.dart';
import 'package:mvvm_login/views/user/userlist/user_list_view.dart';
import 'package:mvvm_login/res/routes/routes_name.dart';


class AppRoutes {
  static appRoutes() => [
    GetPage(
        name: RouteName.welcomeScreen,
        page: () => LoginView(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRight),
    GetPage(
        name: RouteName.loginScreen,
        page: () => LoginView(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRight),
    GetPage(
        name: RouteName.userListScreen,
        page: () => UserListScreen(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRight),
    GetPage(
        name: RouteName.bottomNav,
        page: () => BottomNavScreen(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRight),
  ];
}
