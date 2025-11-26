import 'package:dental_lab_app/data/models/profile_info/get_profile_info.dart';

abstract class ProfileState{
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final UserResponse profile;
  ProfileSuccess(this.profile);
}

class ProfileFailure extends ProfileState {
  final String message;
  ProfileFailure(this.message);
}
