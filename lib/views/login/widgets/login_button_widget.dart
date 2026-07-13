import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mvvm_login/res/components/round_button.dart';
import 'package:mvvm_login/view_models/controllers/login/login_controller.dart';
import 'package:mvvm_login/utilis/utilis.dart';
import 'package:mvvm_login/utilis/loading_page.dart';


class LoginButton extends StatelessWidget {
  final formKey;
  LoginButton({super.key, required this.formKey});
  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => RoundButton(
        loading: loginVM.loading.value,
            onPress: () {
              if (loginVM.emailController.value.text.trim().isEmpty) {
                Utlis.toastMessage("Username is required");
                return;
              }
              if (loginVM.passwordController.value.text.trim().isEmpty) {
                Utlis.toastMessage("Password is required");
                return;
              }
              if (formKey.currentState!.validate()) {
                loginVM.loginApi();
              }
            },
        title: "Login",
        width: 500,
      ),
    );
  }
}
