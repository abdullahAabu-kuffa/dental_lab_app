import 'package:dental_lab_app/core/routing/app_router.dart';
import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:dental_lab_app/data/models/home/order_response.dart';
import 'package:dental_lab_app/generated/l10n.dart';
import 'package:dental_lab_app/logic/cubit/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuildOrderItem extends StatelessWidget {
  const BuildOrderItem({
    super.key,
    required this.order,
    required this.themeState,
  });
  final Order order;
  final ThemeCubit themeState;
  @override
  Widget build(BuildContext context) {
    final df = DateFormat.yMMMd().add_jm();

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.orderDetailsRoute,
          arguments: order,
        );
      },
      onHover: (isHovering) {
        isHovering
            ? (themeState.isDark
                  ? AppColors.darkGreyColor
                  : AppColors.whiteColor70)
            : Colors.transparent;
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: themeState.isDark
                  ? AppColors.darkGreyColor
                  : AppColors.hintTextColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
            color: themeState.isDark
                ? AppColors.darkGreyColor
                : AppColors.hintTextColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Text(
                  '${S.of(context).Order} #${order.id}',
                  style: TextStyle(
                    color: themeState.isDark
                        ? AppColors.whiteColor70
                        : AppColors.primBgColor,
                    fontSize: 18.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Patient',
                      style: TextStyle(
                        color: themeState.isDark
                            ? AppColors.whiteColor70
                            : AppColors.primBgColor,
                        fontSize: 18.0,
                      ),
                    ),
                     Text(
                      order.options.patientName,
                      style: TextStyle(
                        color: themeState.isDark
                            ? AppColors.whiteColor70
                            : AppColors.primBgColor,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      order.status,
                      style: TextStyle(
                        color: order.status == 'COMPLETED'
                            ? Colors.green
                            : order.status == 'In Progress' || order.status == 'PENDING'
                            ? Colors.orange
                            : Colors.red,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(df.format(order.createdAt)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
