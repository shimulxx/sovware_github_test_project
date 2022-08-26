import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sovware_github_test_project/api/cache_use_case/cache_use_case.dart';
import 'package:sovware_github_test_project/api/model/github_list_response.dart';
import 'package:sovware_github_test_project/app_connectivity/connectivity_use_case.dart';
import 'package:sovware_github_test_project/app_constants/app_constants.dart';
import '../../screen/app_screen_data_model/screen_data_bundle_model.dart';

abstract class GitHubListRepository{
    Future<ScreenDataBundle> getListDataBundle({required Map<String, dynamic> queryParameters});
}

class GitHubListRepositoryImp implements GitHubListRepository{
  final Dio dio;
  final CacheUseCase cacheUseCase;
  final ConnectivityUseCase connectivityUseCase;
  late bool deviceIsConnected;

  GitHubListRepositoryImp({
    required this.dio,
    required this.connectivityUseCase,
    required this.cacheUseCase,
  });

  @override
  Future<ScreenDataBundle> getListDataBundle({required Map<String, dynamic> queryParameters}) async{
    print(queryParameters);
    late final String? response;
    late final bool fromCache;
    deviceIsConnected = await connectivityUseCase.deviceIsConnected;

    if(cacheUseCase.isFromCache(queryParameters: queryParameters, isConnected: deviceIsConnected)){
      response = cacheUseCase.getResponseFromCache(queryParameters: queryParameters);
      fromCache = true;
    }else{
      try{
        final curRes = await dio.get(searchRepositoryEndPoint, queryParameters: queryParameters);
        final statusCode = curRes.statusCode;
        response = curRes.data;
        if(curRes.statusCode != 200){
          return Future.error('${json.decode(response!)['message']}, Response code: $statusCode');
        }
        else{ await cacheUseCase.saveResponseToCache(queryParameters: queryParameters, response: response!); }
      }
      catch(e){ return Future.error(e); }
      fromCache = false;
    }
    //implement isolate
    final details = await compute(_parseList, response!);
    return ScreenDataBundle.fromItemList(fromCache: fromCache, items: details.items, deviceIsConnected: deviceIsConnected);
  }

  //isolate use here for faster parsing
  static GithubListResponse _parseList(String jsonResponse) {
    final jsonObj = json.decode(jsonResponse);
    return GithubListResponse.fromMap(jsonObj);
  }

}