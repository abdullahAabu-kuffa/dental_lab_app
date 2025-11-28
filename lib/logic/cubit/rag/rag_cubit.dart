import 'package:dental_lab_app/data/services/api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'rag_state.dart';

class RagCubit extends Cubit<RagState> {
  final ApiServices apiServices;

  RagCubit(this.apiServices) : super(RagInitial());

  Future<void> fetchRagAnswer(String question) async {
    emit(RagLoading());

    try {
      final result = await apiServices.ragApi(question: question);
      emit(RagSuccess(result));
    } catch (e) {
      emit(RagError(e.toString()));
    }
  }
}
