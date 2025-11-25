import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:dental_lab_app/presentation/screens/auth/widgets/custom_txt.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isdark = false;
  bool isSwitched = false;
  bool isEnglish = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                color: AppColors.whiteColor,
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
                color: AppColors.whiteColor,
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
                  color: AppColors.darkGreyColor,
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
                            txt: 'SETTINGS',
                            color: AppColors.greyColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.notifications_outlined,
                            color: AppColors.whiteColor70,
                          ),
                          const SizedBox(width: 10),
                          CustomText(
                            txt: 'Notifications',
                            color: AppColors.whiteColor70,
                          ),
                          const Spacer(),
                          Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            },
                            activeThumbColor: AppColors.yellowColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.language_outlined,
                            color: AppColors.whiteColor70,
                          ),
                          const SizedBox(width: 10),
                          CustomText(
                            txt: 'Language',
                            color: AppColors.whiteColor70,
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isEnglish = !isEnglish;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                              decoration: BoxDecoration(
                                color: AppColors.greyColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: CustomText(
                                txt:isEnglish?'English': 'Arabic',
                                color: AppColors.whiteColor70,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            isdark
                                ? Icons.light_mode_outlined
                                : Icons.dark_mode_outlined,
                            color: AppColors.whiteColor70,
                          ),
                          const SizedBox(width: 10),
                          CustomText(
                            txt:isdark ? 'Light Mode' : 'Dark Mode',
                            color: AppColors.whiteColor70,
                          ),
                          const Spacer(),
                          Switch(
                            value: isdark,
                            onChanged: (value) {
                              setState(() {
                                isdark = value;
                              });
                            },
                            activeThumbColor: AppColors.yellowColor,
                          ),
                        ],
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
