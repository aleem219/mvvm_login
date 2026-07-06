import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mvvm_login/utilis/utilis.dart';
import 'package:mvvm_login/models/login/user_model.dart';
import 'package:mvvm_login/res/repository/login_repository/login_repository.dart';
import 'package:mvvm_login/res/routes/routes_name.dart';
import 'package:mvvm_login/view_models/user_prefrence/user_prefrence.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      'username': emailController.value.text,
      'password': passwordController.value.text,
    };
    _api.loginApi(data).then((value) {
      loading.value = false;
      print(value);

      if (value['accessToken'] != null) {
        UserModel userModel = UserModel(
          accessToken: value['accessToken'],
          isLogin: true,
        );
        userPreference.saveUser(userModel);

        Get.toNamed(RouteName.userListScreen)!.then((value) => {});
        Utlis.toastMessage("Login successful");
      } else {
        Utlis.toastMessage(value['message'] ?? "Login failed");
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utlis.toastMessage(error.toString());
    });
  }
}
