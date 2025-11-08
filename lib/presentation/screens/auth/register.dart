import 'package:dental_lab_app/core/constants/app_constants.dart';
import 'package:dental_lab_app/core/routing/app_router.dart';
import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:dental_lab_app/presentation/widgets/custom_btn.dart';
import 'package:dental_lab_app/presentation/widgets/custom_dropdown.dart';
import 'package:dental_lab_app/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? _selectedValue = 'One'; // Default selected value
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
                  children: [
                    const SizedBox(height: 50),
                    SvgPicture.asset(AppImages.logo),
                    const SizedBox(height: 15),
                    Text(
                      AppStrings.createYourAccount,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.personalInfo,
                        style: TextStyle(
                          color: AppColors.yellowColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          AppStrings.fullName,
                          style: TextStyle(
                            color: AppColors.whiteColor70,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                      hint: AppStrings.enterYourFullName,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.text_format,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          AppStrings.email,
                          style: TextStyle(
                            color: AppColors.whiteColor70,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                      hint: AppStrings.enterYourEmail,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.email, color: AppColors.greyColor),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          AppStrings.phoneNumber,
                          style: TextStyle(
                            color: AppColors.whiteColor70,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                      hint: AppStrings.enterYourPhoneNumber,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.phone_android_outlined,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.security,
                        style: TextStyle(
                          color: AppColors.yellowColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          AppStrings.password,
                          style: TextStyle(
                            color: AppColors.whiteColor70,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
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
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          AppStrings.confirmPassword,
                          style: TextStyle(
                            color: AppColors.whiteColor70,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                      hint: AppStrings.enterYourConfirmPassword,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.visibility_off,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.professionalInformation,
                        style: TextStyle(
                          color: AppColors.yellowColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          AppStrings.specialization,
                          style: TextStyle(
                            color: AppColors.whiteColor70,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    CustomDropdown(
                      hint: 'Select an option',
                      value: _selectedValue,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedValue = newValue;
                        });
                      },
                      suffixIcon: Icon(Icons.arrow_drop_down),
                      items: ['One', 'Two', 'Three', 'Four'],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          AppStrings.clinicOrLabName,
                          style: TextStyle(
                            color: AppColors.whiteColor70,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                      hint: AppStrings.enterClinicOrLabName,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.text_format,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomBtn(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          AppStrings.signUp,
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
                          AppStrings.elreadyHaveAnAccount,
                          style: TextStyle(color: AppColors.greyColor),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          child: Text(
                            AppStrings.login,
                            style: TextStyle(color: AppColors.yellowColor),
                          ),
                          onTap: () =>
                              Navigator.pushNamed(context, Routes.loginRoute),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
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
