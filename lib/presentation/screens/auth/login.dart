import 'package:dental_lab_app/core/constants/app_constants.dart';
import 'package:dental_lab_app/core/routing/app_router.dart';
import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:dental_lab_app/presentation/screens/auth/widgets/custom_txt.dart';
import 'package:dental_lab_app/presentation/widgets/custom_btn.dart';
import 'package:dental_lab_app/presentation/screens/auth/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
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
                    CustomText(
                      txt: AppStrings.welcomeBack,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                    ),
                    const SizedBox(height: 20),
                    CustomText(
                      txt: AppStrings.loginToYourAccount,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(height: 20),
                    Row(children: [CustomText(txt: AppStrings.email)]),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: emailController,
                      hint: AppStrings.enterYourEmail,
                      suffixIcon: Icon(Icons.email, color: AppColors.greyColor),
                    ),
                    const SizedBox(height: 16),
                    Row(children: [CustomText(txt: AppStrings.password)]),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: passwordController,
                      obscureText: !isPasswordVisible,
                      hint: AppStrings.enterYourPassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10),
                        CustomText(
                          txt: AppStrings.forgotPassword,
                          color: AppColors.yellowColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    CustomBtn(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, Routes.registerRoute);
                        }
                      },
                      child: Center(
                        child: CustomText(
                          txt: AppStrings.login,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w600,
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
                          onTap: () => Navigator.pushNamed(
                            context,
                            Routes.registerRoute,
                          ),
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
