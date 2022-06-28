import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../app_constants/app_constants.dart';

final getIt = GetIt.I;

void registerAllDependency() async{
  //register dio
  final dio = Dio(BaseOptions(
    baseUrl: appBaseUrl,
    responseType: ResponseType.plain,
    connectTimeout: 15 * 1000,
    receiveTimeout: 15 * 1000,
    validateStatus: (status) => status! < 500,
  ));
  getIt.registerLazySingleton<Dio>(() => dio);


}
