import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:sovware_github_test_project/api/controller_use_cases/controller_use_cases.dart';
import 'package:sovware_github_test_project/api/repository/repository.dart';
import 'package:sovware_github_test_project/app_router/app_router.dart';
import 'package:sovware_github_test_project/screen/list_screen/controller/list_screen_controller_cubit.dart';
import 'package:sovware_github_test_project/screen/list_screen/inner_widgets/radio_group/controller/radio_group_cubit.dart';

import '../app_constants/app_constants.dart';
import '../date_time/date_time_use_cases.dart';

final getIt = GetIt.I;

Future<void> registerAllDependency() async{
  _registerDio();
  _registerListScreen();
  _registerAppRouter();
  _registerDateTime();
}

void _registerDateTime(){
  //app date use case
  getIt.registerLazySingleton<DateFormat>(() => DateFormat(kAppDateTimeFormat));
  getIt.registerLazySingleton<AppDateTimeFormatUseCase>(() => AppDateTimeFormatUseCaseImp(dateFormat: getIt()));
}

void _registerAppRouter(){
  //register app router
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());
}

void _registerDio(){
  //register dio base options
  getIt.registerLazySingleton<BaseOptions>(() => BaseOptions(
    baseUrl: appBaseUrl,
    responseType: ResponseType.plain,
    connectTimeout: 15 * 1000,
    receiveTimeout: 15 * 1000,
    validateStatus: (status) => status! < 500,
  ));
  //register dio
  getIt.registerLazySingleton<Dio>(() => Dio(getIt()));
}

void _registerListScreen(){
  //register list screen cubit
  getIt.registerFactory<ListScreenCubit>(() => ListScreenCubit(getListDataBundleUseCase: getIt()));

  //register getListDataBundleUseCase as singleton
  getIt.registerLazySingleton<GetListDataBundleUseCase>(() => GetListDataBundleUseCaseImp(gitHubListRepository: getIt()));

  //register repository
  getIt.registerLazySingleton<GitHubListRepository>(() => GitHubListRepositoryImp(dio: getIt()));

  //register radio group cubit
  getIt.registerFactory<RadioGroupCubit>(() => RadioGroupCubit());
}
