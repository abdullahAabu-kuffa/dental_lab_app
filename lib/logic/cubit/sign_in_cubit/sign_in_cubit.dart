import 'package:bloc/bloc.dart';
import 'package:dental_lab_app/data/models/auth/sign_in_models.dart';
import 'package:dental_lab_app/data/services/api_services.dart';
import 'package:flutter/rendering.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final ApiServices apiServices;

  SignInCubit(this.apiServices) : super(SignInInitial());

  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoading());
    try {
      final result = await apiServices.signIn(email: email, password: password);
      debugPrint('Sign In Result: ${result.status}, Token: ${result.data}');
      emit(SignInSuccess(result));
    } catch (e) {
      emit(SignInError(e.toString()));
    }
  }
}
