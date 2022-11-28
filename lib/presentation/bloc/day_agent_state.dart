import 'package:iranian/core/failure.dart';
import 'package:iranian/domain/entities/day_agent_request_entity.dart';

abstract class DayAgentState {}

class Loading extends DayAgentState {}

class Error extends DayAgentState {
  final Failure failure;
  Error(this.failure);
}

class Success extends DayAgentState {
  final DayAgentResponseEntity dayAgentResponseEntity;
  Success(this.dayAgentResponseEntity);
}
