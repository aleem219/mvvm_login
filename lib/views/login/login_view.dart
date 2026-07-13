import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_login/views/login/widgets/input_email_widget.dart';
import 'package:mvvm_login/views/login/widgets/inout_password_widget.dart';
import 'package:mvvm_login/views/login/widgets/login_button_widget.dart';
import 'package:mvvm_login/res/color/colors.dart';
import 'package:mvvm_login/view_models/controllers/login/login_controller.dart';
import 'package:network_checker/network_checker.dart';
import 'package:mvvm_login/views/login/widgets/auth_links_widget.dart';
import 'package:mvvm_login/views/login/widgets/new_user_widget.dart';
import 'package:mvvm_login/utilis/loading_page.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
          title: const Text(
            "Login Screen",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: NetworkChecker(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Login Now!",
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 35),
                          ),
                          const SizedBox(height: 80),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                InputEmailWidget(),
                                const SizedBox(height: 20),
                                InputPasswordWidget(),
                              ],
                            ),
                          ),
                          AuthLinksWidget(
                            onAlreadyLoggedIn: () {},
                            onForgotPassword: () {},
                          ),
                          const SizedBox(height: 30),
                          LoginButton(
                            formKey: _formKey,
                          ),
                          const SizedBox(height: 8),
                          NewUserWidget(onSignUp: () {
                            print('Signup is tapped');
                          }),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
