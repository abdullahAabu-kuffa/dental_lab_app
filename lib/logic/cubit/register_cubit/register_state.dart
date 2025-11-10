part of 'register_cubit.dart';

abstract class RegisterState{
  const RegisterState();
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final RegisterModel registerData;

  const RegisterSuccess(this.registerData);
}

class RegisterError extends RegisterState {
  final String message;

  const RegisterError(this.message);
}
