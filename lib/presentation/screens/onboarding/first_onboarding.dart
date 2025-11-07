import 'package:dental_lab_app/presentation/widgets/custom_qoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstOnboarding extends StatelessWidget {
  const FirstOnboarding({super.key});

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
            Container(
              width: 329,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff54482A), width: 2),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 34, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const SizedBox(height: 24),
                    Row(
                      children: [
                        Text('Material Types', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400)),
                        Spacer(),
                        SvgPicture.asset('assets/images/checked_onboarding.svg'),
                      ],
                    ),
                    const Divider(color: Color(0xff54482A), thickness: 1, height: 10),
                    Row(
                      children: [
                        Text(
                          'Shade Selection',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        SvgPicture.asset('assets/images/checked_onboarding.svg'),
                      ],
                    ),
                    const Divider(
                      color: Color(0xff54482A),
                      thickness: 1,
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Design Options',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          'assets/images/checked_onboarding.svg',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 56,),
            Text(
              'Choose Your Material & Order Online',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 19,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Easily select and verify every detail of your order for perfect results, every time.',
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
