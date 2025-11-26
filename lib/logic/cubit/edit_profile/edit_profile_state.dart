import 'package:dental_lab_app/data/models/profile_info/edit_profile_info.dart';

abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {
  final EditProfileInfo updatedProfile;

  EditProfileSuccess(this.updatedProfile);
}

class EditProfileFailure extends EditProfileState {
  final String message;

  EditProfileFailure(this.message);
}
