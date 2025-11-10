import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.txt,
    this.color = AppColors.whiteColor70,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 16,
  });
  final String txt;
  final Color? color;
  final FontWeight? fontWeight;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
