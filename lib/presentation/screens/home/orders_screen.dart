// ignore_for_file: unused_field

import 'package:dental_lab_app/core/errorHandler/error_handler.dart';
import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:dental_lab_app/logic/cubit/profile_info_cubit/profile_info_cubit.dart';
import 'package:dental_lab_app/logic/cubit/theme_cubit/theme_cubit.dart';
import 'package:dental_lab_app/logic/cubit/user_orders_cubit/user_orders_cubit.dart';
import 'package:dental_lab_app/presentation/screens/home/widgets/home_header.dart';
import 'package:dental_lab_app/presentation/screens/home/widgets/build_order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<ProfileCubit>().fetchProfile());
    context.read<UserOrdersCubit>().fetchUserOrders();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>();
    // const List<Map<String, dynamic>> ordersData = [
    //   {
    //     "id": 1,
    //     "userId": 10,
    //     "options": [
    //       {"shade": "A2", "finish": "glazed"},
    //     ],
    //     "totalPrice": 250.0,
    //     "status": "Pending",
    //     "invoiceId": 12001,
    //     "createdAt": "2025-11-20T10:00:00.000Z",
    //     "updatedAt": "2025-11-20T10:00:00.000Z",
    //   },
    //   {
    //     "id": 3,
    //     "userId": 12,
    //     "options": [],
    //     "totalPrice": 150.0,
    //     "status": "Completed",
    //     "invoiceId": 12003,
    //     "createdAt": "2025-11-18T11:45:00.000Z",
    //     "updatedAt": "2025-11-24T09:05:00.000Z",
    //   },
    //   {
    //     "id": 2,
    //     "userId": 11,
    //     "options": [
    //       {"shade": "B1"},
    //     ],
    //     "totalPrice": 480.5,
    //     "status": "Pending",
    //     "invoiceId": 12002,
    //     "createdAt": "2025-11-22T08:15:00.000Z",
    //     "updatedAt": "2025-11-23T14:30:00.000Z",
    //   },
    //   {
    //     "id": 3,
    //     "userId": 12,
    //     "options": [],
    //     "totalPrice": 150.0,
    //     "status": "In Progress",
    //     "invoiceId": 12003,
    //     "createdAt": "2025-11-18T11:45:00.000Z",
    //     "updatedAt": "2025-11-24T09:05:00.000Z",
    //   },
    //   {
    //     "id": 7,
    //     "userId": 16,
    //     "options": [
    //       {"units": 2, "component": "abutment"},
    //     ],
    //     "totalPrice": 150.0,
    //     "status": "Completed",
    //     "invoiceId": 12007,
    //     "createdAt": "2025-11-10T09:00:00.000Z",
    //     "updatedAt": "2025-11-12T10:30:00.000Z",
    //   },
    // ];

    // final List<Order> orders = ordersData
    //     .map((json) => Order.fromJson(json))
    //     .toList();

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
                  HomeHeader(),
                  ordersTitleSection('All Orders', themeState),
                  BlocListener<UserOrdersCubit, UserOrdersState>(
                    listener: (context, state) {
                      if (state is UserOrdersFailure) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.message)));
                      }
                    },
                    child: BlocBuilder<UserOrdersCubit, UserOrdersState>(
                      builder: (context, state) {
                        if (state is UserOrdersLoading) {
                          Center(child: CircularProgressIndicator());
                        }
                        if (state is UserOrdersFailure) {
                          ErrorHandler.showSnack(
                            context,
                            state.message,
                            Colors.red,
                          );
                        }
                        if (state is UserOrdersSuccess) {
                          final orders = state.userOrdersData.data.orders;
                          if (orders.isEmpty) {
                            return Center(
                              child: Text(
                                'No orders found.',
                                style: TextStyle(
                                  color: themeState.isDark
                                      ? AppColors.whiteColor70
                                      : AppColors.primBgColor,
                                  fontSize: 18.0,
                                ),
                              ),
                            );
                          }
                          return ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: orders.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 16.0),
                            itemBuilder: (context, index) {
                              final order = orders[index];
                              return BuildOrderItem(
                                order: order,
                                themeState: themeState,
                              );
                            },
                          );
                        }
                        return const SizedBox.shrink();
                      },
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
