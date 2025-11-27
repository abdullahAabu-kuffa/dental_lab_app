// ignore_for_file: unused_field

import 'package:dental_lab_app/core/constants/app_icons.dart';
import 'package:dental_lab_app/core/constants/app_strings.dart';
import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:dental_lab_app/data/models/home/orders.dart';
import 'package:dental_lab_app/logic/cubit/profile_info_cubit/profile_info_cubit.dart';
import 'package:dental_lab_app/logic/cubit/profile_info_cubit/profile_info_state.dart';
import 'package:dental_lab_app/logic/cubit/theme_cubit/theme_cubit.dart';
import 'package:dental_lab_app/presentation/widgets/build_order_item.dart';
//import 'package:dental_lab_app/presentation/widgets/build_order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  // static const orders = {
  //   "orders": [
  //     {
  //       "id": 1,
  //       "userId": 10,
  //       "options": [
  //         {"shade": "A2", "finish": "glazed"},
  //       ],
  //       "totalPrice": 250.0,
  //       "status": "PENDING",
  //       "invoiceId": 12001,
  //       "createdAt": "2025-11-20T10:00:00.000Z",
  //       "updatedAt": "2025-11-20T10:00:00.000Z",
  //     },
  //     {
  //       "id": 2,
  //       "userId": 11,
  //       "options": [
  //         {"shade": "B1"},
  //       ],
  //       "totalPrice": 480.5,
  //       "status": "PROCESSING",
  //       "invoiceId": 12002,
  //       "createdAt": "2025-11-22T08:15:00.000Z",
  //       "updatedAt": "2025-11-23T14:30:00.000Z",
  //     },
  //     {
  //       "id": 3,
  //       "userId": 12,
  //       "options": [],
  //       "totalPrice": 150.0,
  //       "status": "COMPLETED",
  //       "invoiceId": 12003,
  //       "createdAt": "2025-11-18T11:45:00.000Z",
  //       "updatedAt": "2025-11-24T09:05:00.000Z",
  //     },
  //     {
  //       "id": 4,
  //       "userId": 13,
  //       "options": [
  //         {"priority": "express", "notes": "check occlusion"},
  //       ],
  //       "totalPrice": 320.75,
  //       "status": "PROCESSING",
  //       "invoiceId": 12004,
  //       "createdAt": "2025-11-24T09:20:00.000Z",
  //       "updatedAt": "2025-11-24T12:00:00.000Z",
  //     },
  //     {
  //       "id": 5,
  //       "userId": 14,
  //       "options": [
  //         {"shade": "C2", "material": "zirconia"},
  //       ],
  //       "totalPrice": 275.0,
  //       "status": "CANCELLED",
  //       "invoiceId": 12005,
  //       "createdAt": "2025-11-15T07:30:00.000Z",
  //       "updatedAt": "2025-11-16T08:00:00.000Z",
  //     },
  //     {
  //       "id": 6,
  //       "userId": 15,
  //       "options": [
  //         {"shipping": "courier", "expected": "2025-11-28T12:00:00.000Z"},
  //       ],
  //       "totalPrice": 600.0,
  //       "status": "PENDING",
  //       "invoiceId": 12006,
  //       "createdAt": "2025-11-25T13:10:00.000Z",
  //       "updatedAt": "2025-11-25T13:10:00.000Z",
  //     },
  //     {
  //       "id": 7,
  //       "userId": 16,
  //       "options": [
  //         {"units": 2, "component": "abutment"},
  //       ],
  //       "totalPrice": 150.0,
  //       "status": "COMPLETED",
  //       "invoiceId": 12007,
  //       "createdAt": "2025-11-10T09:00:00.000Z",
  //       "updatedAt": "2025-11-12T10:30:00.000Z",
  //     },
  //     {
  //       "id": 8,
  //       "userId": 17,
  //       "options": [
  //         {"shade": "A1", "finish": "matte"},
  //       ],
  //       "totalPrice": 420.25,
  //       "status": "PROCESSING",
  //       "invoiceId": 12008,
  //       "createdAt": "2025-11-26T07:45:58.836Z",
  //       "updatedAt": "2025-11-26T17:45:58.836Z",
  //     },
  //   ],
  // };
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<ProfileCubit>().fetchProfile());
  }

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>();
    const List<Map<String, dynamic>> ordersData = [
       {
        "id": 1,
        "userId": 10,
        "options": [
          {"shade": "A2", "finish": "glazed"},
        ],
        "totalPrice": 250.0,
        "status": "Pending",
        "invoiceId": 12001,
        "createdAt": "2025-11-20T10:00:00.000Z",
        "updatedAt": "2025-11-20T10:00:00.000Z",
      },
      {
        "id": 2,
        "userId": 11,
        "options": [
          {"shade": "B1"},
        ],
        "totalPrice": 480.5,
        "status": "Pending",
        "invoiceId": 12002,
        "createdAt": "2025-11-22T08:15:00.000Z",
        "updatedAt": "2025-11-23T14:30:00.000Z",
      },
      {
        "id": 3,
        "userId": 12,
        "options": [],
        "totalPrice": 150.0,
        "status": "In Progress",
        "invoiceId": 12003,
        "createdAt": "2025-11-18T11:45:00.000Z",
        "updatedAt": "2025-11-24T09:05:00.000Z",
      },
    ];

    final List<Order> orders = ordersData
        .map((json) => Order.fromJson(json))
        .toList();
 
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (state is ProfileFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Error: ${state.message}")));
        }
        if (state is ProfileSuccess) {
          //final orders = state.profile.data.user.orders;
          return Scaffold(
            body: SafeArea(
              child: SizedBox.expand(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 20.0,
                    ),
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
                              'Welcome ${state.profile.data.user.fullName} ',
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
                              ...orders.map(
                                          (order) => BuildOrderItem(
                                            order: order,
                                            themeState: themeState,
                                          ),
                                        )
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
                              Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Center(
                                        child: Text(
                                          'No previous orders available.',
                                          style: TextStyle(
                                            color: themeState.isDark
                                                ? AppColors.whiteColor70
                                                : AppColors.primBgColor,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                    )
                                  
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
        return const SizedBox.shrink();
      },
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
