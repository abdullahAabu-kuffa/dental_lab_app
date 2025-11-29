import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:dental_lab_app/generated/l10n.dart';
import 'package:dental_lab_app/logic/cubit/edit_profile/edit_profile_cubit.dart';
import 'package:dental_lab_app/logic/cubit/localization/local_cubit.dart';
import 'package:dental_lab_app/presentation/screens/auth/widgets/custom_text_field.dart';
import 'package:dental_lab_app/presentation/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileForm extends StatelessWidget {
  final TextEditingController nameCtrl;
  final TextEditingController phoneCtrl;
  final TextEditingController clinicNameCtrl;
  final TextEditingController clinicAddressCtrl;

  const EditProfileForm({
    super.key,
    required this.nameCtrl,
    required this.phoneCtrl,
    required this.clinicNameCtrl,
    required this.clinicAddressCtrl,
  });

  @override
  Widget build(BuildContext context) {
    final localeCubit = context.watch<LocalizationCubit>();

    final isEnglish = localeCubit.state.languageCode == 'en';
    return Container(
      decoration: BoxDecoration(
        color: AppColors.goldenColor,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          Align(
            alignment: isEnglish
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Text(
              S.of(context).editProfile,
              style: TextStyle(color: AppColors.greyColor, fontSize: 15),
            ),
          ),
          const SizedBox(height: 10),

          CustomTextField(
            controller: nameCtrl,
            hint: S.of(context).enterYourFullName,
          ),
          const SizedBox(height: 10),

          CustomTextField(
            controller: phoneCtrl,
            hint: S.of(context).enterYourPhoneNumber,
          ),
          const SizedBox(height: 10),

          CustomTextField(
            controller: clinicNameCtrl,
            hint: S.of(context).clinicOrLabName,
          ),
          const SizedBox(height: 10),

          CustomTextField(
            controller: clinicAddressCtrl,
            hint: S.of(context).addressLabel,
          ),
          const SizedBox(height: 20),

          CustomBtn(
            child: Center(
              child: Text(
                S.of(context).Save,
                style: TextStyle(color: AppColors.blackColor, fontSize: 20),
              ),
            ),
            onTap: () {
              context.read<EditProfileCubit>().editProfile(
                fullName: nameCtrl.text,
                phoneNumber: phoneCtrl.text,
                clinicName: clinicNameCtrl.text,
                clinicAddress: clinicAddressCtrl.text,
              );
            },
          ),
        ],
      ),
    );
  }
}
