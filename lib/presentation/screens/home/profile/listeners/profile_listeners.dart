import 'package:dental_lab_app/core/helpers/cach_helper.dart';
import 'package:dental_lab_app/core/routing/app_router.dart';
import 'package:dental_lab_app/logic/cubit/edit_profile/edit_profile_cubit.dart';
import 'package:dental_lab_app/logic/cubit/edit_profile/edit_profile_state.dart';
import 'package:dental_lab_app/logic/cubit/profile_info_cubit/profile_info_cubit.dart';
import 'package:dental_lab_app/logic/cubit/profile_info_cubit/profile_info_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocListener> profileListeners(
  BuildContext context,
  TextEditingController name,
  TextEditingController phone,
  TextEditingController clinic,
  TextEditingController address,
) {
  return [
    // EDIT PROFILE LISTENER
    BlocListener<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileLoading) {
          CachHelper.clearProfileData();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Saving profile...")));
        }

        if (state is EditProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Profile updated successfully")),
          );
          context.read<ProfileCubit>().fetchProfile();
        }

        if (state is EditProfileFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Error: ${state.message}")));
        }
      },
    ),

    // PROFILE FETCH LISTENER
    BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileSuccess) {
          name.text = state.profile.data.user.fullName;
          phone.text = state.profile.data.user.phoneNumber;
          clinic.text = state.profile.data.user.clinicName;
          address.text = state.profile.data.user.clinicAddress;
        }

        if (state is ProfileFailure) {
          CachHelper.setLoggdIn(false);
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.loginRoute,
            (_) => false,
          );
        }
      },
    ),
  ];
}
