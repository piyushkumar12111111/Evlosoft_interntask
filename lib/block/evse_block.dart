import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/evse_model.dart';
import '../services/api_service.dart';
import 'evse_event.dart';
import 'evse_state.dart';

class EVSEBloc extends Bloc<EVSEEvent, EVSEState> {
  final ApiService apiService;

  EVSEBloc({required this.apiService}) : super(EVSEInitial()) {
    on<FetchEVSEEvent>((event, emit) async {
      emit(EVSELoading());
      try {
        final evses = await apiService.fetchEVSEs();
        emit(EVSELoaded(evses));
      } catch (e) {
        emit(EVSEError(e.toString()));
      }
    });
  }
}
