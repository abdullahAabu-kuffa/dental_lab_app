import 'package:flutter/material.dart';

class CustomQoute extends StatelessWidget {
  const CustomQoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Egypt's Avante",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          " dental",
          style: TextStyle(
            color: Color(0xffD9AC40),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          " solution",
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
