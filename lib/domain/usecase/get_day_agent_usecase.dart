import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:iranian/core/failure.dart';

import '../entities/day_agent_request_entity.dart';
import '../repository/day_agent_repository.dart';

@injectable
class GetDayAgentUsecase {
  final DayAgentRepository repository;

  GetDayAgentUsecase(this.repository);
  Future<Either<Failure, DayAgentResponseEntity>> execute() async =>
      await repository.getDayAgent();
}
