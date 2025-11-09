part of 'sign_in_cubit.dart';

abstract class SignInState{
  const SignInState();
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final SignInModels signInData;

  const SignInSuccess(this.signInData);
}

class SignInError extends SignInState {
  final String message;

  const SignInError(this.message);
}
