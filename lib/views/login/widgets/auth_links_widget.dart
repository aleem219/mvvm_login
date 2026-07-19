import 'package:flutter/material.dart';
import 'package:mvvm_login/res/color/colors.dart';

class AuthLinksWidget extends StatefulWidget {
  final VoidCallback onAlreadyLoggedIn;
  final VoidCallback onForgotPassword;
  final ValueChanged<bool>? onRememberMeChanged;
  final bool initialRememberMe;

  const AuthLinksWidget({
    super.key,
    required this.onAlreadyLoggedIn,
    required this.onForgotPassword,
    this.onRememberMeChanged,
    this.initialRememberMe = false,
  });

  @override
  State<AuthLinksWidget> createState() => _AuthLinksWidgetState();
}

class _AuthLinksWidgetState extends State<AuthLinksWidget> {
  late bool _rememberMe;

  @override
  void initState() {
    super.initState();
    _rememberMe = widget.initialRememberMe;
  }

  void _toggleRememberMe() {
    setState(() {
      _rememberMe = !_rememberMe;
    });
    widget.onRememberMeChanged?.call(_rememberMe);
    widget.onAlreadyLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: _toggleRememberMe,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _rememberMe
                        ? AppColor.primaryColor
                        : Colors.transparent,
                    border: Border.all(
                      color: AppColor.primaryColor,
                      width: 2,
                    ),
                  ),
                  child: _rememberMe
                      ? const Icon(
                    Icons.check,
                    size: 14,
                    color: Colors.white,
                  )
                      : null,
                ),
                const SizedBox(width: 8),
                Text(
                  "Remember me",
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        TextButton(
          onPressed: widget.onForgotPassword,
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