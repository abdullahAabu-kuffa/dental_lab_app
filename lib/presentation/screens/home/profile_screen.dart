import 'package:dental_lab_app/core/constants/app_strings.dart';
import 'package:dental_lab_app/core/helpers/cach_helper.dart';
import 'package:dental_lab_app/core/routing/app_router.dart';
import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:dental_lab_app/logic/cubit/theme_cubit/theme_cubit.dart';
import 'package:dental_lab_app/presentation/screens/auth/widgets/custom_text_field.dart';
import 'package:dental_lab_app/presentation/screens/auth/widgets/custom_txt.dart';
import 'package:dental_lab_app/presentation/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSwitched = false;
  bool isEnglish = true;
  final fullNameController = TextEditingController(text: 'Ahmed Mohamed');
  final phoneNumberController = TextEditingController(text: '01123456789');
  final clinickNameController = TextEditingController(text: 'Dental Lab');
  final clinicAddressController = TextEditingController(text: 'Cairo, Egypt');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeState = context.watch<ThemeCubit>();
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 25),
              CustomText(
                txt: 'Profile',
                color: themeState.isDark
                    ? AppColors.whiteColor
                    : AppColors.primBgColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 20),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.yellowColor, AppColors.lightYellowColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              const SizedBox(height: 10),
              CustomText(
                txt: 'Dr.Evelyn Reed',
                color: themeState.isDark
                    ? AppColors.whiteColor
                    : AppColors.primBgColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              CustomText(
                txt: 'evelynreed@gmail.com',
                color: AppColors.greyColor,
                fontSize: 16,
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: size.height * 0.3,
                decoration: BoxDecoration(
                  color: themeState.isDark
                      ? AppColors.darkGreyColor
                      : AppColors.goldenColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                    vertical: 15,
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              CustomText(
                                txt: 'Edit Profile',
                                color: AppColors.greyColor,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: fullNameController,
                            hint: AppStrings.enterYourFullName,
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: phoneNumberController,
                            hint: AppStrings.enterYourPhoneNumber,
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: clinickNameController,
                            hint: AppStrings.clinicOrLabName,
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: clinicAddressController,
                            hint: AppStrings.addressLabel,
                          ),
                          const SizedBox(height: 10),
                          CustomBtn(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                debugPrint(
                                  'fullName: ${fullNameController.text}\n'
                                  'phoneNumber: ${phoneNumberController.text}\n'
                                  'clinicName: ${clinickNameController.text}\n'
                                  'address: ${clinicAddressController.text}',
                                );
                              }
                            },
                            child: Center(
                              child: const Text(
                                'Save',
                                style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: size.height * 0.3,
                margin: EdgeInsets.only(bottom: size.height * 0.05),
                decoration: BoxDecoration(
                  color: themeState.isDark
                      ? AppColors.darkGreyColor
                      : AppColors.goldenColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                    vertical: 15,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            txt: 'Settings',
                            color: AppColors.greyColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.language_outlined,
                            color: AppColors.whiteColor70,
                          ),
                          const SizedBox(width: 10),
                          CustomText(
                            txt: isEnglish ? 'Arabic' : 'English',
                            color: AppColors.whiteColor70,
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isEnglish = !isEnglish;
                              });
                            },
                            child: Switch(
                              value: isEnglish,
                              onChanged: (value) {
                                setState(() {
                                  isEnglish = value;
                                });
                              },
                              activeThumbColor: AppColors.yellowColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            !themeState.isDark
                                ? Icons.light_mode_outlined
                                : Icons.dark_mode_outlined,
                            color: AppColors.whiteColor70,
                          ),
                          const SizedBox(width: 10),
                          CustomText(
                            txt: !themeState.isDark
                                ? 'Light Mode'
                                : 'Dark Mode',
                            color: AppColors.whiteColor70,
                          ),
                          const Spacer(),
                          Switch(
                            value: !themeState.isDark,
                            onChanged: (value) {
                              context.read<ThemeCubit>().toggleTheme();
                            },
                            activeThumbColor: AppColors.yellowColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          CachHelper.setLoggdIn(false);
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.loginRoute,
                            (route) => false,
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout_outlined,
                              color: AppColors.logOutColor,
                            ),
                            const SizedBox(width: 10),
                            CustomText(
                              txt: 'Logout',
                              color: AppColors.logOutColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
