import 'package:dental_lab_app/presentation/screens/onboarding/onboarding_view.dart';
import 'package:dental_lab_app/presentation/widgets/custom_qoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _slideIn = false;

  @override
  void initState() {
    super.initState();
    // Trigger the animation after the first frame
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _slideIn = true;
      });
    });
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const OnboardingView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          color: const Color(0xff2A2A2A),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSlide(
                offset: _slideIn ? Offset(0, 0) : Offset(0, -10),
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: SvgPicture.asset("assets/images/logo.svg", height: 120),
              ),
              const SizedBox(height: 12),
              AnimatedSlide(
                offset: _slideIn ? Offset(0, 0) : Offset(0, 15),
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: CustomQoute(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
