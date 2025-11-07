import 'package:dental_lab_app/core/constants/app_constants.dart';
import 'package:dental_lab_app/core/routing/app_router.dart';
import 'package:dental_lab_app/core/theme/app_colors.dart';
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
      body: SafeArea(
        child: Stack(
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
                    Navigator.pushNamedAndRemoveUntil(context, Routes.loginRoute, (route) => false);
                  }
                },
                child: Center(
                  child: Text(
                    _currentPage < 2 ? AppStrings.next : AppStrings.getStarted,
                    style: TextStyle(
                      color: AppColors.blackColor,
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
                color: AppColors.goldenColor,
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
                      color: _currentPage == index
                          ? AppColors.yellowColor
                          : AppColors.whiteColor70,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
