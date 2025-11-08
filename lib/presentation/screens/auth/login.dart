import 'package:dental_lab_app/core/constants/app_constants.dart';
import 'package:dental_lab_app/core/routing/app_router.dart';
import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:dental_lab_app/presentation/widgets/custom_btn.dart';
import 'package:dental_lab_app/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 70),
                    SvgPicture.asset(AppImages.logo),
                    const SizedBox(height: 15),
                    Text(
                      AppStrings.welcomeBack,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      AppStrings.loginToYourAccount,
                      style: TextStyle(
                        color: AppColors.whiteColor70,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          AppStrings.email,
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      hint: AppStrings.enterYourEmail,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.email, color: AppColors.greyColor),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          AppStrings.password,
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      hint: AppStrings.enterYourPassword,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.visibility_off,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          AppStrings.forgotPassword,
                          style: TextStyle(
                            color: AppColors.yellowColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    CustomBtn(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          AppStrings.login,
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          AppStrings.dontHaveAnAccount,
                          style: TextStyle(color: AppColors.greyColor),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          child: Text(
                            AppStrings.signUp,
                            style: TextStyle(color: AppColors.yellowColor),
                          ),
                          onTap: () =>
                              Navigator.pushNamed(context, Routes.registerRoute),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
