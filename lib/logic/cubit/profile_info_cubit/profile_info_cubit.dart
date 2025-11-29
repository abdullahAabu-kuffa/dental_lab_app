import 'package:dental_lab_app/core/helpers/cach_helper.dart';
import 'package:dental_lab_app/data/models/profile_info/get_profile_info.dart';
import 'package:dental_lab_app/data/services/api_services.dart';
import 'package:dental_lab_app/logic/cubit/profile_info_cubit/profile_info_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProfileCubit extends Cubit<ProfileState> {
  final ApiServices profileService;

  ProfileCubit(this.profileService) : super(ProfileInitial());

  Future<void> fetchProfile() async {
    emit(ProfileLoading());

    try {
      final UserResponse? cachedProfile = CachHelper.getProfileData();
      if (cachedProfile != null) {
        emit(ProfileSuccess(cachedProfile));
        return;
      }
      final UserResponse profile = await profileService.getProfileInfo();
      await CachHelper.setProfileData(profile);

      CachHelper.setUser(profile.data.user.toJson());
      emit(ProfileSuccess(profile));
    } catch (e) {
      emit(ProfileFailure(e.toString()));
    }
  }
}


