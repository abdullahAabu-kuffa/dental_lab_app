import 'package:dental_lab_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomQoute extends StatelessWidget {
  const CustomQoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).quote,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          S.of(context).dental,
          style: TextStyle(
            color: Color(0xffD9AC40),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          S.of(context).solution,
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
