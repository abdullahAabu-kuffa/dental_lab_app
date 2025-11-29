import 'package:dental_lab_app/core/helpers/cach_helper.dart';
import 'package:dental_lab_app/core/routing/app_router.dart';
import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:dental_lab_app/generated/l10n.dart';
import 'package:dental_lab_app/logic/cubit/localization/local_cubit.dart';
import 'package:dental_lab_app/logic/cubit/theme_cubit/theme_cubit.dart';
import 'package:dental_lab_app/presentation/screens/auth/widgets/custom_txt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCard extends StatefulWidget {
  const SettingsCard({super.key});

  @override
  State<SettingsCard> createState() => _SettingsCardState();
}

class _SettingsCardState extends State<SettingsCard> {
  bool isEnglish = true;
  void logout() {
    CachHelper.setLoggdIn(false);
    CachHelper.clearProfileData();
    Navigator.pushNamedAndRemoveUntil(context, Routes.loginRoute, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    final localeCubit = context.watch<LocalizationCubit>();

    final isEnglish = localeCubit.state.languageCode == 'ar';
    final isDark = themeCubit.isDark;

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: size.height * 0.05),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkGreyColor : AppColors.goldenColor,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          Align(
            alignment:isEnglish ? Alignment.centerRight : Alignment.centerLeft,
            child: CustomText(
              txt: S.of(context).Settings,
              color: AppColors.greyColor,
            ),
          ),
          const SizedBox(height: 15),

          Row(
            children: [
              const Icon(
                Icons.language_outlined,
                color: AppColors.whiteColor70,
              ),
              const SizedBox(width: 10),

              CustomText(
                txt: isEnglish ? S.of(context).Arabic : S.of(context).English,
                color: AppColors.whiteColor70,
              ),

              const Spacer(),

              Switch(
                value: isEnglish,
                onChanged: (v) {
                  context.read<LocalizationCubit>().changeLanguage(
                    v ? 'ar' : 'en',
                  );
                },
                activeThumbColor: AppColors.yellowColor,
              ),
            ],
          ),

          Row(
            children: [
              Icon(
                isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
                color: AppColors.whiteColor70,
              ),
              const SizedBox(width: 10),

              CustomText(
                txt: isDark ? S.of(context).dark_mode : S.of(context).light_mode, 
                color: AppColors.whiteColor70,
              ),

              const Spacer(),

              Switch(
                value: !isDark,
                onChanged: (_) => context.read<ThemeCubit>().toggleTheme(),
                activeColor: AppColors.yellowColor,
              ),
            ],
          ),

      
          InkWell(
            onTap: () {
              CachHelper.setLoggdIn(false);
              CachHelper.clearProfileData();

              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.loginRoute,
                (_) => false,
              );
            },
            child:  Row(
              children: [
                Icon(Icons.logout_outlined, color: AppColors.logOutColor),
                SizedBox(width: 10),
                CustomText(txt: S.of(context).Logout, color: AppColors.logOutColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
