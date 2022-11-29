import 'package:dartz/dartz.dart';
import 'package:iranian/core/failure.dart';
import 'package:iranian/domain/entities/day_agent_request_entity.dart';
import 'package:iranian/domain/entities/day_agent_response_entity.dart';

abstract class DayAgentRepository {

  Future<Either<Failure,DayAgentResponseEntity>> getDayAgent({required DayAgentRequestEntity request});
}