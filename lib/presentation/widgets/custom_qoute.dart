import 'package:dental_lab_app/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CustomQoute extends StatelessWidget {
  const CustomQoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.quote,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          AppStrings.dental,
          style: TextStyle(
            color: Color(0xffD9AC40),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          AppStrings.solution,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
