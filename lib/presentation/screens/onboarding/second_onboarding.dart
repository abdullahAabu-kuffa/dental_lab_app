import 'package:dental_lab_app/presentation/widgets/custom_qoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SecondOnboarding extends StatelessWidget {
  const SecondOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff2A2A2A),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            CustomQoute(),
            const SizedBox(height: 24),
            SvgPicture.asset('assets/images/logo.svg'),
            const SizedBox(height: 30),
            SizedBox(
              width: 329,
              height: MediaQuery.of(context).size.height * 0.3,
              child: SvgPicture.asset('assets/images/upload.svg'),
            ),
            const SizedBox(height: 56),
            Text(
              '100% Digital Case Submission',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 19),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Upload your ExoCAD or intraoral scan files directly to our cloud platform.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}