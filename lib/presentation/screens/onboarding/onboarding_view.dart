import 'package:dental_lab_app/presentation/screens/login/login.dart';
import 'package:dental_lab_app/presentation/screens/onboarding/first_onboarding.dart';
import 'package:dental_lab_app/presentation/screens/onboarding/second_onboarding.dart';
import 'package:dental_lab_app/presentation/screens/onboarding/third_onboarding.dart';
import 'package:dental_lab_app/presentation/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            controller: _pageController,
            children: const [
              FirstOnboarding(),
              SecondOnboarding(),
              ThirdOnboarding(),
            ],
          ),
          Positioned(
            bottom: 101,
            left: 24,
            right: 24,
            child: CustomBtn(
              onTap: () {
                if (_currentPage < 2) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (_) => const Login()));
                }
              },
              child: Center(
                child: Text(
                  _currentPage < 2 ? 'Next' : 'Get Started',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: Divider(
              color: Color(0xff54482A),
              thickness: 2,
              indent: 50,
              endIndent: 50,
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 16 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Color(0xffD9AC40) : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }), 
            ),
          )
        ],
      ),
    );
  }
}
