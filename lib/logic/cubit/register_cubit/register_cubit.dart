import 'package:bloc/bloc.dart';
import 'package:dental_lab_app/data/models/auth/register_models.dart';
import 'package:dental_lab_app/data/services/api_services.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> register({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
    required String clinicName,
    required String clinicAddress,
  }) async {
    emit(RegisterLoading());
    try {
      final result = await ApiServices().register(
        fullName: fullName,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        clinicName: clinicName,
        clinicAddress: clinicAddress,
      );
      // debugPrint('Register Result: ${result.message}, Token: ${result.accessToken}');
      emit(RegisterSuccess(result));
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }
}
