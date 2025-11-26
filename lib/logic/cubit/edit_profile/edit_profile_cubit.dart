import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dental_lab_app/data/services/api_services.dart';

import 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final ApiServices apiServices;

  EditProfileCubit(this.apiServices) : super(EditProfileInitial());

  Future<void> editProfile({
    required String fullName,
    required String phoneNumber,
    required String clinicName,
    required String clinicAddress,
  }) async {
    emit(EditProfileLoading());

    try {
      final result = await apiServices.editProfileInfo(
        fullName: fullName,
        phoneNumber: phoneNumber,
        clinickName: clinicName,
        clinickAdress: clinicAddress,
      );

      emit(EditProfileSuccess(result));
    } catch (e) {
      emit(EditProfileFailure(e.toString()));
    }
  }
}
