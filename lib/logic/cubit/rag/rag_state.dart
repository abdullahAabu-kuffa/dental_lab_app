

import 'package:dental_lab_app/data/models/Rag/rag_response.dart';

abstract class RagState {
}

class RagInitial extends RagState {}

class RagLoading extends RagState {}

class RagSuccess extends RagState {
  final RagResponse response;

  RagSuccess(this.response);
}

class RagError extends RagState {
  final String message;

  RagError(this.message);
}
