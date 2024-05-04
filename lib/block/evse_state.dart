import '../models/evse_model.dart';

abstract class EVSEState {}

class EVSEInitial extends EVSEState {}

class EVSELoading extends EVSEState {}

class EVSELoaded extends EVSEState {
  final List<EVSE> evses;
  EVSELoaded(this.evses);
}

class EVSEError extends EVSEState {
  final String message;
  EVSEError(this.message);
}
