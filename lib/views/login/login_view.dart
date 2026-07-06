import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_login/views/login/widgets/input_email_widget.dart';
import 'package:mvvm_login/views/login/widgets/inout_password_widget.dart';
import 'package:mvvm_login/res/color/colors.dart';
import 'package:mvvm_login/view_models/controllers/login/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // final loginVM = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
          // title: const Text(
          //   "Login Screen",
          //   style: TextStyle(
          //       color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          // ),
        ),
      ),
    );
  }
}
