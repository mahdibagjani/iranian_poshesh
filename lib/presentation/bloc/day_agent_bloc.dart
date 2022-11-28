import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:iranian/core/failure.dart';
import 'package:iranian/domain/usecase/get_day_agent_usecase.dart';
import 'package:iranian/presentation/bloc/day_agent_event.dart';
import 'package:iranian/presentation/bloc/day_agent_state.dart';

@injectable
class DayAgentBloc extends Bloc<DayAgentAPIEvent, DayAgentState> {
  final GetDayAgentUsecase usecase;
  DayAgentBloc(this.usecase) : super(Loading()) {
    on<DayAgentAPIEvent>((event, emit) async {
      emit(Loading());

      try {
        final res = await usecase.execute();
        res.fold((l) => emit(Error(ServerFailure())), (r) => emit(Success(r)));
      } catch (e) {
        emit(Error(ServerFailure()));
      }
    });
  }
}
