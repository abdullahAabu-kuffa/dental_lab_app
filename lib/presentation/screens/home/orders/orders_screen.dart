import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:dental_lab_app/generated/l10n.dart';
import 'package:dental_lab_app/logic/cubit/theme_cubit/theme_cubit.dart';
import 'package:dental_lab_app/logic/cubit/user_orders_cubit/user_orders_cubit.dart';
import 'package:dental_lab_app/presentation/screens/home/widgets/home_header.dart';
import 'package:dental_lab_app/presentation/screens/home/orders/build_order_item.dart';
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
    context.read<UserOrdersCubit>().fetchUserOrders();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>();
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
                  //SearchSection(),
                  ordersTitleSection(S.of(context).allorders, themeState),
                  BlocBuilder<UserOrdersCubit, UserOrdersState>(
                    buildWhen: (previous, current) {
                      if (previous is UserOrdersSuccess &&
                          current is UserOrdersSuccess) {
                        return previous.userOrdersData.data.orders !=
                            current.userOrdersData.data.orders;
                      }
                      return true; 
                    },

                    builder: (context, state) {
                      if (state is UserOrdersLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is UserOrdersFailure) {
                        return Center(
                          child: Text(
                            'No Orders Yet',
                            style: const TextStyle(color: Colors.red, fontSize: 20),
                          ),
                        );
                      } else if (state is UserOrdersSuccess) {
                        final orders = state.userOrdersData.data.orders;

                        if (orders.isEmpty) {
                          return Center(child: Text(S.of(context).noOrders));
                        }
                        
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: orders.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10.0),
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
