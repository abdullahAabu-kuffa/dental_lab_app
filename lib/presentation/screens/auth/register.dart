import 'package:dental_lab_app/core/constants/app_constants.dart';
import 'package:dental_lab_app/core/routing/app_router.dart';
import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:dental_lab_app/presentation/screens/auth/widgets/custom_txt.dart';
import 'package:dental_lab_app/presentation/widgets/custom_btn.dart';
import 'package:dental_lab_app/presentation/widgets/custom_dropdown.dart';
import 'package:dental_lab_app/presentation/screens/auth/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? _selectedValueSpcialization;
  String? _selectedValueCity;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController clinicNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
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
                  children: [
                    const SizedBox(height: 50),
                    SvgPicture.asset(AppImages.logo),
                    const SizedBox(height: 15),
                    CustomText(
                      txt: AppStrings.createYourAccount,
                      color: AppColors.whiteColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        txt: AppStrings.personalInfo,
                        color: AppColors.yellowColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(children: [CustomText(txt: AppStrings.fullName)]),
                    const SizedBox(height: 5),
                    CustomTextField(
                      hint: AppStrings.enterYourFullName,
                      controller: fullNameController,
                      suffixIcon: Icon(Icons.abc, color: AppColors.greyColor),
                    ),
                    const SizedBox(height: 10),
                    Row(children: [CustomText(txt: AppStrings.email)]),
                    const SizedBox(height: 5),
                    CustomTextField(
                      hint: AppStrings.enterYourEmail,
                      controller: emailController,
                      suffixIcon: Icon(Icons.email, color: AppColors.greyColor),
                    ),
                    const SizedBox(height: 10),
                    Row(children: [CustomText(txt: AppStrings.phoneNumber)]),
                    const SizedBox(height: 5),
                    CustomTextField(
                      hint: AppStrings.enterYourPhoneNumber,
                      controller: phoneNumberController,
                      suffixIcon: Icon(
                        Icons.phone_android_outlined,
                        color: AppColors.greyColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        txt: AppStrings.security,
                        color: AppColors.yellowColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(children: [CustomText(txt: AppStrings.password)]),
                    const SizedBox(height: 5),
                    CustomTextField(
                      hint: AppStrings.enterYourPassword,
                      controller: passwordController,
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
                      children: [CustomText(txt: AppStrings.confirmPassword)],
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                      hint: AppStrings.enterYourConfirmPassword,
                      controller: confirmPasswordController,
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
                      child: CustomText(
                        txt: AppStrings.professionalInformation,
                        color: AppColors.yellowColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(children: [CustomText(txt: AppStrings.specialization)]),
                    const SizedBox(height: 5),
                    CustomDropdown(
                      hint: AppStrings.selectYourSpecialization,
                      value: _selectedValueSpcialization,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedValueSpcialization = newValue;
                        });
                      },
                    
                      items: ['One', 'Two', 'Three', 'Four'],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [CustomText(txt: AppStrings.clinicOrLabName)],
                    ),
                    const SizedBox(height: 5),
                    CustomTextField(
                      hint: AppStrings.enterClinicOrLabName,
                      controller: clinicNameController,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.abc, color: AppColors.greyColor),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(children: [CustomText(txt: AppStrings.cityLabel)]),
                    const SizedBox(height: 5),
                    CustomDropdown(
                      hint: AppStrings.selectYourCity,
                      value: _selectedValueCity,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedValueCity = newValue;
                        });
                      },
                      items: ['One', 'Two', 'Three', 'Four'],
                    ),
                    const SizedBox(height: 10),
                    Row(children: [CustomText(txt: AppStrings.addressLabel)]),
                    const SizedBox(height: 5),
                    CustomTextField(
                      hint: AppStrings.enterYourFullAddress,
                      controller: addressController,
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.abc, color: AppColors.greyColor),
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomBtn(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, Routes.loginRoute);
                        }
                      },
                      child: Center(
                        child: CustomText(
                          txt: AppStrings.signUp,
                          color: AppColors.blackColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
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
