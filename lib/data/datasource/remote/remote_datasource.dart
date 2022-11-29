import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:iranian/core/server_exception.dart';
import 'package:iranian/data/model/day_agent_response_model.dart';

import '../../model/day_agent_request_model.dart';

abstract class RemoteDatasource {
  Future<DayAgentResponseModel> getDayAgent(
      {required DayAgentRequestModel request});
}

@LazySingleton(as: RemoteDatasource)
@injectable
class RemoteDatasourceImp extends RemoteDatasource {
  final Dio dio;
  RemoteDatasourceImp(this.dio);
  @override
  Future<DayAgentResponseModel> getDayAgent(
      {required DayAgentRequestModel request}) async {
    final response = await dio.get(
      "api/app/Dey_agent/requests_list/",
      queryParameters: request.toJson(),
    );
    try {
      if (response.statusCode == 200) {
        final res = DayAgentResponseModel.fromJson(
            response.data as Map<String, dynamic>);
        return res;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
