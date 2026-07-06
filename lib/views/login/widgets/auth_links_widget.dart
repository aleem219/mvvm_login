import 'package:flutter/material.dart';
import 'package:mvvm_login/res/color/colors.dart';

class AuthLinksWidget extends StatelessWidget {
  final VoidCallback onAlreadyLoggedIn;
  final VoidCallback onForgotPassword;

  const AuthLinksWidget({
    super.key,
    required this.onAlreadyLoggedIn,
    required this.onForgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onAlreadyLoggedIn,
          child: Text(
            "Already logged in?",
            style: TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        TextButton(
          onPressed: onForgotPassword,
          child: Text(
            "Forgot Password?",
            style: TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}