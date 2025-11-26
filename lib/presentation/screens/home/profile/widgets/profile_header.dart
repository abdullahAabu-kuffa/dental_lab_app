import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:dental_lab_app/logic/cubit/theme_cubit/theme_cubit.dart';
import 'package:dental_lab_app/presentation/screens/auth/widgets/custom_txt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;

  const ProfileHeader({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>();

    return Column(
      children: [
        const SizedBox(height: 25),
        CustomText(
          txt: "Profile",
          color: theme.isDark ? AppColors.whiteColor : AppColors.primBgColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 20),

        // Avatar
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.yellowColor, AppColors.lightYellowColor],
            ),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 10),

        // Name
        CustomText(
          txt: name,
          color: theme.isDark ? AppColors.whiteColor : AppColors.primBgColor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 10),

        // Email
        CustomText(txt: email, color: AppColors.greyColor, fontSize: 16),
      ],
    );
  }
}
