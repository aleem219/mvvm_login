import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mvvm_login/res/components/round_button.dart';
import 'package:mvvm_login/view_models/controllers/login/login_controller.dart';

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
