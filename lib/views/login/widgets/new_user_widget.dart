import 'package:flutter/material.dart';
import 'package:mvvm_login/res/color/colors.dart';

class NewUserWidget extends StatelessWidget {
  final VoidCallback onSignUp;

  const NewUserWidget({
    super.key,
    required this.onSignUp,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "New User? ",
          style: TextStyle(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          onPressed: onSignUp,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            "Sign Up",
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