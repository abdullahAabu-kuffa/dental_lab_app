import 'package:flutter/material.dart';

class CustomQoute extends StatelessWidget {
  const CustomQoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Egypt's First",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          " Digital",
          style: TextStyle(
            color: Color(0xffD9AC40),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          " Dental Lab",
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
