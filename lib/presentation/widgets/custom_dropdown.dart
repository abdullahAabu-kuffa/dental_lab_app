import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    this.hint,
    this.items,
    this.value,
    this.onChanged,
    this.suffixIcon,
  });

  final String? hint;
  final List<String>? items;
  final String? value;
  final ValueChanged<String?>? onChanged;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.whiteColor),
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
      items: items?.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(
              color: AppColors.whiteColor70,
            ),
          ),
        );
      }).toList(),
    );
  }
}
