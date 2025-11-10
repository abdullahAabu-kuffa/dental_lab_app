import 'package:dental_lab_app/core/constants/app_constants.dart';
import 'package:dental_lab_app/core/errorHandler/error_handler.dart';
import 'package:dental_lab_app/core/routing/app_router.dart';
import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:dental_lab_app/logic/cubit/register_cubit/register_cubit.dart';
import 'package:dental_lab_app/presentation/screens/auth/widgets/custom_txt.dart';
import 'package:dental_lab_app/presentation/widgets/custom_btn.dart';
import 'package:dental_lab_app/presentation/screens/auth/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController clinicNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  String get fullName => fullNameController.value.text;
  String get email => emailController.value.text;
  String get password => passwordController.value.text;
  String get phoneNumber => phoneNumberController.value.text;
  String get clinicName => clinicNameController.value.text;
  String get clinicAddress => addressController.value.text;

  void submitForm() {
    context.read<RegisterCubit>().register(
      fullName: fullName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      clinicName: clinicName,
      clinicAddress: clinicAddress,
    );
  }

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
                child: BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) => {
                    if (state is RegisterLoading)
                      {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                      },

                    if (state is RegisterSuccess)
                      {
                        Navigator.pop(context),
                        ErrorHandler.showSnack(
                          context,
                          'Register Successfully',
                          Colors.green,
                        ),
                        Navigator.pushNamed(context, Routes.loginRoute),
                      },

                    if (state is RegisterError)
                      {
                        Navigator.pop(context), // Close the loading dialog
                        ErrorHandler.showSnack(
                          context,
                          state.message,
                          Colors.red,
                        ),
                      },
                  },
                  builder: (context, state) {
                    return Column(
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
                          suffixIcon: Icon(
                            Icons.abc,
                            color: AppColors.greyColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(children: [CustomText(txt: AppStrings.email)]),
                        const SizedBox(height: 5),
                        CustomTextField(
                          hint: AppStrings.enterYourEmail,
                          controller: emailController,
                          suffixIcon: Icon(
                            Icons.email,
                            color: AppColors.greyColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [CustomText(txt: AppStrings.phoneNumber)],
                        ),
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
                          obscureText: !isPasswordVisible,
                          controller: passwordController,
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
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            CustomText(txt: AppStrings.confirmPassword),
                          ],
                        ),
                        const SizedBox(height: 5),
                        CustomTextField(
                          hint: AppStrings.enterYourConfirmPassword,
                          controller: confirmPasswordController,
                          obscureText: !isConfirmPasswordVisible,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isConfirmPasswordVisible =
                                    !isConfirmPasswordVisible;
                              });
                            },
                            icon: Icon(
                              isConfirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
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
                        Row(
                          children: [
                            CustomText(txt: AppStrings.clinicOrLabName),
                          ],
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
                        Row(
                          children: [CustomText(txt: AppStrings.addressLabel)],
                        ),
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
                              submitForm();
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
                              onTap: () => Navigator.pushNamed(
                                context,
                                Routes.loginRoute,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
