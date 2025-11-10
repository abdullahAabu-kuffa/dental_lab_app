import 'package:dental_lab_app/core/constants/app_constants.dart';
import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:dental_lab_app/presentation/widgets/custom_qoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SecondOnboarding extends StatelessWidget {
  const SecondOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primBgColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            CustomQoute(),
            const SizedBox(height: 24),
            SvgPicture.asset(AppImages.logo),
            const SizedBox(height: 30),
            SizedBox(
              width: 329,
              height: MediaQuery.of(context).size.height * 0.3,
              child: SvgPicture.asset(AppImages.upload),
            ),
            const SizedBox(height: 56),
            Text(
              AppStrings.digitalCaseSubmission,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 19),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                AppStrings.uploadInstructions,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.whiteColor70,
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