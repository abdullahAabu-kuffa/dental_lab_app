import 'dart:ui';
import 'package:dental_lab_app/core/constants/app_icons.dart';
import 'package:dental_lab_app/logic/cubit/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({
    super.key,
    required this.currentIndexScreen,
    required this.onTap,
  });

  final int currentIndexScreen;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15), 
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primBgColor, 
              borderRadius: BorderRadius.circular(40),
            ),
            child: BottomNavigationBar(
              backgroundColor: theme.isDark ? Colors.transparent : AppColors.goldenColor, 
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndexScreen,
              onTap: onTap,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedIconTheme:  IconThemeData(
                color: theme.isDark ? AppColors.goldenColor : AppColors.whiteColor,
                size: 30,
              ),
              unselectedIconTheme: const IconThemeData(
                color: AppColors.greyColor,
                size: 28,
              ),
              items: [
                BottomNavigationBarItem(icon: AppIcons.homeIcon, label: ""),
                BottomNavigationBarItem(icon: AppIcons.videoIcon, label: ""),
                BottomNavigationBarItem(
                  icon: AppIcons.favoriteIcon,
                  label: "",
                ),
                BottomNavigationBarItem(icon: AppIcons.personIcon, label: ""),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
