import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:iranian/core/failure.dart';
import 'package:iranian/core/server_exception.dart';
import 'package:iranian/data/model/day_agent_response_model.dart';
import 'package:iranian/domain/entities/day_agent_request_entity.dart';

abstract class RemoteDatasource {
  Future<DayAgentResponseModel> getDayAgent();
}

@LazySingleton(as: RemoteDatasource)
@injectable
class RemoteDatasourceImp extends RemoteDatasource {
  final Dio dio;
  RemoteDatasourceImp(this.dio);
  @override
  Future<DayAgentResponseModel> getDayAgent() async {
    final response = await dio.get(
      "api/app/Dey_agent/requests_list/?tab=issuance",
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'jwt eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjcwNTA1OTMzLCJqdGkiOiI3NjdiYmRlMzk0NzI0MzAwOWUyNzFmNGE3MzZjMmU0NiIsInVzZXJfaWQiOjF9.oixr8nGbJte1imHY6xsHlZQJIKzMAbgE7YU2vgjPwnE',
        },
      ),
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
