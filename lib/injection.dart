
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';
final GetIt getIt = GetIt.instance;
bool doRefreshToken = false;

@injectableInit
Future<void> configureInjection(String env) async {
  await $initGetIt(getIt, environment: env);
}

@module
abstract class RegisterModule {
  @Named("BaseUrl")
  // new base url
  String get baseUrl => 'https://sa-day1.iranianpooshesh.com/';


  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) {
    final dioInstance = Dio(BaseOptions(
      baseUrl: url,
      headers: {
        'Content-Type': 'application/json',
        // 'x-version': getIt<SharedPreferences>().getString(versionCodeLocalStorageKey),
      },
      
      receiveDataWhenStatusError: true,
    ));
     dioInstance.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
        logPrint: (log) {
          final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
          pattern.allMatches(log.toString()).forEach((match) => print(match.group(0)));
        },
      ),
    );

    return dioInstance;
  }


}
