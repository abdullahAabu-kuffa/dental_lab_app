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
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primBgColor, 
        borderRadius: BorderRadius.circular(40),
      ),
      child: BottomNavigationBar(
        backgroundColor: theme.isDark ? AppColors.goldenColor : AppColors.yellowColor, 
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndexScreen,
        onTap: onTap,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme:  IconThemeData(
          color: theme.isDark ? AppColors.yellowColor : AppColors.whiteColor,
          size: 30,
        ),
        unselectedIconTheme: const IconThemeData(
          color: AppColors.greyColor,
          size: 28,
        ),
        items: [
          BottomNavigationBarItem(icon: AppIcons.homeIcon, label: ""),
          BottomNavigationBarItem(icon: AppIcons.ordersIcon, label: ""),
          BottomNavigationBarItem(
            icon: AppIcons.eventsIcon,
            label: "",
          ),
          BottomNavigationBarItem(icon: AppIcons.personIcon, label: ""),
        ],
      ),
    );
  }
}
