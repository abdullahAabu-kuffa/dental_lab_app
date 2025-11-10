import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ErrorHandler {

  static void showSnack(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Center(
          child: Text(
            message,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        duration: const Duration(seconds: 5),
      ),
    );
  }
}
