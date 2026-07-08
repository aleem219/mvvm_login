import 'package:flutter/material.dart';

class AppDialog {
  static Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
    Color titleColor = Colors.green,

    String primaryButtonText = 'OK',
    VoidCallback? onPrimaryPressed,

    String? secondaryButtonText,
    VoidCallback? onSecondaryPressed,
  }) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: titleColor,
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontStyle: FontStyle.italic,
            fontSize: 16.0,
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          if (secondaryButtonText != null)
            Expanded(
              child: OutlinedButton(
                onPressed: onSecondaryPressed ?? () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.grey.shade700,
                  side: BorderSide(color: Colors.grey.shade400, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: const Size(0, 50),
                ),
                child: Text(
                  secondaryButtonText,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          if (secondaryButtonText != null) const SizedBox(width: 12),
          Expanded(
            child: OutlinedButton(
              onPressed: onPrimaryPressed ?? () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                foregroundColor: titleColor,
                side: BorderSide(color: titleColor, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                minimumSize: const Size(0, 50),
              ),
              child: Text(
                primaryButtonText,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}