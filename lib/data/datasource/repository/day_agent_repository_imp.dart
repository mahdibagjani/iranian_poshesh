import 'package:injectable/injectable.dart';
import 'package:iranian/core/server_exception.dart';
import 'package:iranian/data/datasource/remote/remote_datasource.dart';
import 'package:iranian/domain/entities/day_agent_response_entity.dart';

import 'package:iranian/core/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../domain/repository/day_agent_repository.dart';
import '../../model/day_agent_request_model.dart';

@LazySingleton(as: DayAgentRepository)
@injectable
class DayAgentRepositoryImp implements DayAgentRepository {
  final RemoteDatasource remoteDatasource;

  DayAgentRepositoryImp(this.remoteDatasource);
  @override
  Future<Either<Failure, DayAgentResponseEntity>> getDayAgent({required DayAgentRequestModel request}) async {
    try {
       print('repository ok1');
      final res = await remoteDatasource.getDayAgent(request:  request);
      print('repository ok');
      return Right(res);
    } on ServerException {
        print('repository bad');
      return Left(ServerFailure());
    }
  }
}
