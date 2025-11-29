import 'package:dental_lab_app/core/helpers/cach_helper.dart';
import 'package:dental_lab_app/core/routing/app_router.dart';
import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:dental_lab_app/logic/cubit/theme_cubit/theme_cubit.dart';
import 'package:dental_lab_app/presentation/screens/auth/widgets/custom_txt.dart';
import 'package:dental_lab_app/presentation/screens/home/widgets/confirmModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCard extends StatefulWidget {
  const SettingsCard({super.key});

  @override
  State<SettingsCard> createState() => _SettingsCardState();
}

class _SettingsCardState extends State<SettingsCard> {
  bool isEnglish = true;
  void logout() {
    CachHelper.setLoggdIn(false);
    CachHelper.clearProfileData();
    Navigator.pushNamedAndRemoveUntil(context, Routes.loginRoute, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>();
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: size.height * 0.05),
      decoration: BoxDecoration(
        color: theme.isDark ? AppColors.darkGreyColor : AppColors.goldenColor,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: CustomText(txt: "Settings", color: AppColors.greyColor),
          ),
          const SizedBox(height: 15),

          // Language Switch
          Row(
            children: [
              const Icon(
                Icons.language_outlined,
                color: AppColors.whiteColor70,
              ),
              const SizedBox(width: 10),
              CustomText(
                txt: isEnglish ? "Arabic" : "English",
                color: AppColors.whiteColor70,
              ),
              const Spacer(),
              Switch(
                value: isEnglish,
                onChanged: (v) => setState(() => isEnglish = v),
                activeColor: AppColors.yellowColor,
              ),
            ],
          ),

          // Theme Switch
          Row(
            children: [
              Icon(
                theme.isDark
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
                color: AppColors.whiteColor70,
              ),
              const SizedBox(width: 10),
              CustomText(
                txt: theme.isDark ? "Dark Mode" : "Light Mode",
                color: AppColors.whiteColor70,
              ),
              const Spacer(),
              Switch(
                value: !theme.isDark,
                onChanged: (_) => context.read<ThemeCubit>().toggleTheme(),
                activeColor: AppColors.yellowColor,
              ),
            ],
          ),

          // Logout
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => ConfirmModel(
                  title: "Logout",
                  message: "Are you sure you want to logout?",
                  confirmText: "Logout",
                  cancelText: "Cancel",
                  onConfirm: () {
                    logout();
                  },
                  
                ),
              );
            },
            child: const Row(
              children: [
                Icon(Icons.logout_outlined, color: AppColors.logOutColor),
                SizedBox(width: 10),
                CustomText(txt: "Logout", color: AppColors.logOutColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
