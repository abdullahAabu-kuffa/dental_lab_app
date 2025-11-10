import 'package:dental_lab_app/core/constants/app_constants.dart';
import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    this.hint,
    this.items,
    this.value,
    this.onChanged,
  });

  final String? hint;
  final List<String>? items;
  final String? value;
  final ValueChanged<String?>? onChanged;

  String? validateDropdown(value) {
    if (value == null || value.isEmpty) {
      if (hint == AppStrings.selectYourSpecialization) {
        return 'Please select your specialization';
      } else if (hint == AppStrings.selectYourCity) {
        return 'Please select your city';
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      onChanged: (newValue) {
        // When the dropdown value changes, trigger the onChanged callback
        if (onChanged != null) {
          onChanged!(newValue); // Ensure the parent widget is updated
        } else {
          onChanged;
        }
      },
      validator: (value) => validateDropdown(value),
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.arrow_drop_down),
        hintText: hint,
        hintStyle: TextStyle(color: AppColors.hintTextColor),
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
      dropdownColor: AppColors.greyColor,
      items: items?.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(color: AppColors.whiteColor70)),
        );
      }).toList(),
    );
  }
}
