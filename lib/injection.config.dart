// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/datasource/remote/remote_datasource.dart' as _i4;
import 'data/datasource/repository/day_agent_repository_imp.dart' as _i6;
import 'domain/repository/day_agent_repository.dart' as _i5;
import 'domain/usecase/get_day_agent_usecase.dart' as _i7;
import 'injection.dart' as _i9;
import 'presentation/bloc/day_agent_bloc.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<String>(
    () => registerModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.lazySingleton<_i3.Dio>(
      () => registerModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.lazySingleton<_i4.RemoteDatasource>(
      () => _i4.RemoteDatasourceImp(get<_i3.Dio>()));
  gh.lazySingleton<_i5.DayAgentRepository>(
      () => _i6.DayAgentRepositoryImp(get<_i4.RemoteDatasource>()));
  gh.factory<_i7.GetDayAgentUsecase>(
      () => _i7.GetDayAgentUsecase(get<_i5.DayAgentRepository>()));
  gh.factory<_i8.DayAgentBloc>(
      () => _i8.DayAgentBloc(get<_i7.GetDayAgentUsecase>()));
  return get;
}

class _$RegisterModule extends _i9.RegisterModule {}
