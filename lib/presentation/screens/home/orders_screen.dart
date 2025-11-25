import 'package:dental_lab_app/core/constants/app_icons.dart';
import 'package:dental_lab_app/core/constants/app_strings.dart';
import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:dental_lab_app/logic/cubit/theme_cubit/theme_cubit.dart';
import 'package:dental_lab_app/presentation/widgets/build_order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final List orders = [
    {'id': '001', 'patient': 'John Doe', 'status': 'In Progress'},
    {'id': '002', 'patient': 'Jane Smith', 'status': 'Completed'},
    {'id': '003', 'patient': 'Alice Johnson', 'status': 'Pending'},
    {'id': '004', 'patient': 'Bob Brown', 'status': 'In Progress'},
    {'id': '005', 'patient': 'Charlie Davis', 'status': 'Completed'},
    {'id': '006', 'patient': 'Diana Evans', 'status': 'Pending'},
    {'id': '007', 'patient': 'Frank Green', 'status': 'In Progress'},
  ];
  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>();
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.quote,
                        style: TextStyle(
                          color: AppColors.yellowColor,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: AppColors.yellowColor,
                        child: Icon(
                          AppIcons.notificationIcon.icon,
                          color: themeState.isDark
                              ? AppColors.primBgColor
                              : AppColors.whiteColor70,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Dr.Ahmed',
                        style: TextStyle(
                          color: themeState.isDark
                              ? AppColors.whiteColor70
                              : AppColors.primBgColor,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Egypt\'s first fully digital dental labioratory.',
                        style: TextStyle(
                          color: themeState.isDark
                              ? AppColors.whiteColor70
                              : AppColors.greyColor,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  ordersTitleSection('Current Orders', themeState),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: themeState.isDark
                            ? AppColors.goldenColor
                            : AppColors.hintTextColor,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...orders.map((order) {
                          return BuildOrderItem(
                            order: order,
                            themeState: themeState,
                          );
                        }),
                      ],
                    ),
                  ),
                  ordersTitleSection('Previous Orders', themeState),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: themeState.isDark
                            ? AppColors.goldenColor
                            : AppColors.hintTextColor,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...orders.map((order) {
                          return BuildOrderItem(
                            order: order,
                            themeState: themeState,
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget ordersTitleSection(String title, ThemeCubit themeState) {
  return Column(
    children: [
      const SizedBox(height: 24.0),
      Text(
        title,
        style: TextStyle(
          color: themeState.isDark
              ? AppColors.whiteColor70
              : AppColors.primBgColor,
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 8.0),
    ],
  );
}
