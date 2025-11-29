import 'package:dental_lab_app/core/constants/app_icons.dart';
import 'package:dental_lab_app/core/constants/app_images.dart';
import 'package:dental_lab_app/core/errorHandler/error_handler.dart';
import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:dental_lab_app/generated/l10n.dart';
import 'package:dental_lab_app/logic/cubit/profile_info_cubit/profile_info_cubit.dart';
import 'package:dental_lab_app/logic/cubit/profile_info_cubit/profile_info_state.dart';
import 'package:dental_lab_app/logic/cubit/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeState();
}

class _HomeState extends State<HomeHeader> {
  @override
  void initState() {
    super.initState();
    // ignore: use_build_context_synchronously
    Future.microtask(() => context.read<ProfileCubit>().fetchProfile());
  }

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text(
            //   S.of(context).quote,
            //   style: TextStyle(
            //     color: AppColors.yellowColor,
            //     fontSize: 24.0,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            SvgPicture.asset(AppImages.logo, height: 35),
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

        const SizedBox(height: 12.0),
        const Divider(color: Colors.grey, thickness: 0.6),
        const SizedBox(height: 12.0),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              const Center(child: CircularProgressIndicator());
            }
            if (state is ProfileFailure) {
              ErrorHandler.showSnack(context, state.message, Colors.red);
            }
            if (state is ProfileSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${S.of(context).welcomeBack} Dr/ ${state.profile.data.user.fullName}',
                    style: TextStyle(
                      color: themeState.isDark
                          ? AppColors.whiteColor70
                          : AppColors.primBgColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    S.of(context).egyptavante,
                    style: TextStyle(
                      color: themeState.isDark
                          ? AppColors.whiteColor70
                          : AppColors.greyColor,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
