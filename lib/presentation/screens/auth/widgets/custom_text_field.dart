import 'package:dental_lab_app/core/constants/app_constants.dart';
import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hint,
    this.obscureText = false,
    this.suffixIcon,
    this.onChanged,
    this.controller,
  });
  final String? hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  String? validateTextFields(value) {
    if (hint == AppStrings.enterYourFullName) {
      if (value == null || value.isEmpty) {
        return 'Please enter your full name';
      }
      if (!RegExp(r'^[A-Za-z ]+$').hasMatch(value)) {
        return '''Please enter a valid full name''';
      }
    } else if (hint == AppStrings.enterYourEmail) {
      if (value == null || value.isEmpty) {
        return 'Please enter your email';
      }
      if (!RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{3,}$',
      ).hasMatch(value)) {
        return 'Please enter a valid email address';
      }
    } else if (hint == AppStrings.enterYourPhoneNumber) {
      if (value == null || value.isEmpty) {
        return 'Please enter your phone number';
      }
      if (value.length != 11) {
        return 'Phone number must be 11 digits long';
      }
    } else if (hint == AppStrings.enterYourPassword) {
      if (value == null || value.isEmpty) {
        return 'Please enter your password';
      }
      if (value.length < 6) {
        return 'Password must contain at least one letter and one number';
      }
    } else if (hint == AppStrings.enterYourConfirmPassword) {
      if (value == null || value.isEmpty) {
        return 'Please enter your confirm password';
      }
      if (value.length < 6) {
        return 'Confirm password must contain at least one letter and one number';
      }
    } else if (hint == AppStrings.enterClinicOrLabName) {
      if (value == null || value.isEmpty) {
        return 'Please enter your clinic or lab name';
      }
    } else if (hint == AppStrings.enterYourFullAddress) {
      if (value == null || value.isEmpty) {
        return 'Please enter your full address';
      }
    }
    return null;
  }

  TextInputType detecteKeyboardType(String? hint) {
    switch (hint) {
      case AppStrings.enterYourEmail:
        return TextInputType.emailAddress;
      case AppStrings.enterYourPhoneNumber:
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => validateTextFields(value),
      keyboardType: detecteKeyboardType(hint),
      cursorColor: AppColors.greyColor,
      style: TextStyle(color: AppColors.hintTextColor),
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.hintTextColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: AppColors.goldenColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: AppColors.greyColor),
        ),
        filled: true,
        fillColor: AppColors.txtFieldFillColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 16.0,
        ),
      ),
    );
  }
}
