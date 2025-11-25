import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:dental_lab_app/logic/cubit/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';

class BuildOrderItem extends StatelessWidget {
  const BuildOrderItem({
    super.key,
    required this.order,
    required this.themeState,
  });
  final Map order;
  final ThemeCubit themeState;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/orderDetails');
      },
      onHover: (isHovering) {
       isHovering
            ? (themeState.isDark
                ? AppColors.darkGreyColor.withOpacity(0.7)
                : AppColors.whiteColor70.withOpacity(0.7))
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order #${order['id']} - ${order['patient']}',
                  style: TextStyle(
                    color: themeState.isDark
                        ? AppColors.whiteColor70
                        : AppColors.primBgColor,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  order['status']!,
                  style: TextStyle(
                    color: order['status'] == 'Completed'
                        ? Colors.green
                        : order['status'] == 'In Progress'
                        ? Colors.orange
                        : Colors.red,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
