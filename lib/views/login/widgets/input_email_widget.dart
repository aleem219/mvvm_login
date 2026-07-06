import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_login/res/color/colors.dart';
import 'package:mvvm_login/utilis/utilis.dart';
import 'package:mvvm_login/view_models/controllers/login/login_controller.dart';

class InputEmailWidget extends StatelessWidget {
  InputEmailWidget({super.key});
  final loginVM = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginVM.emailController.value,
      focusNode: loginVM.emailFocusNode.value,
      validator: (Value) {
        if (Value!.isEmpty) {
          return "";
        }
        return null;
      },
      onFieldSubmitted: (value) {
        Utlis.fieldFocusChange(context, loginVM.emailFocusNode.value,
            loginVM.passwordFocusNode.value);
      },
      decoration: InputDecoration(
        suffixIcon: const Icon(
          Icons.email_outlined,
          color: AppColor.primaryColor,
        ),
        hintText: "Email",
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColor.primaryColor), // Custom focused border color
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
