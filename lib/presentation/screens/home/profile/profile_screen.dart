
import 'package:dental_lab_app/logic/cubit/profile_info_cubit/profile_info_cubit.dart';
import 'package:dental_lab_app/logic/cubit/profile_info_cubit/profile_info_state.dart';
import 'package:dental_lab_app/presentation/screens/home/profile/listeners/profile_listeners.dart';
import 'package:dental_lab_app/presentation/screens/home/profile/widgets/edit_profile_form.dart';
import 'package:dental_lab_app/presentation/screens/home/profile/widgets/profile_header.dart';
import 'package:dental_lab_app/presentation/screens/home/profile/widgets/settings_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final clinicNameCtrl = TextEditingController();
  final clinicAddressCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<ProfileCubit>().fetchProfile());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: profileListeners(
        context,
        nameCtrl,
        phoneCtrl,
        clinicNameCtrl,
        clinicAddressCtrl,
      ),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (state is ProfileFailure) {
            return Scaffold(
              body: Center(child: Text("Error: ${state.message}")),
            );
          }

          return Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  ProfileHeader(
                    name: nameCtrl.text,
                    email: state is ProfileSuccess
                        ? state.profile.data.user.email
                        : '',
                  ),
                  const SizedBox(height: 20),

                  EditProfileForm(
                    nameCtrl: nameCtrl,
                    phoneCtrl: phoneCtrl,
                    clinicNameCtrl: clinicNameCtrl,
                    clinicAddressCtrl: clinicAddressCtrl,
                  ),
                  const SizedBox(height: 20),

                  SettingsCard(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
