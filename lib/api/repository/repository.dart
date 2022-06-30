import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sovware_github_test_project/api/model/github_list_response.dart';
import 'package:sovware_github_test_project/app_connectivity/connectivity_use_case.dart';
import 'package:sovware_github_test_project/app_constants/app_constants.dart';
import 'package:sovware_github_test_project/app_store/shared_pref_use_case.dart';
import '../../screen/app_screen_data_model/screen_data_bundle_model.dart';

abstract class GitHubListRepository{
    Future<ScreenDataBundle> getListDataBundle({required Map<String, dynamic> queryParameters});
}

class GitHubListRepositoryImp implements GitHubListRepository{
  final Dio dio;
  final SharedPrefUseCase sharedPrefUseCase;
  final ConnectivityUseCase connectivityUseCase;
  late bool deviceIsConnected;

  GitHubListRepositoryImp({required this.dio, required this.sharedPrefUseCase, required this.connectivityUseCase});

  String _generateKeyFromQueryParameters({required Map<String, dynamic> queryParameters}){
    if(!queryParameters.containsKey('sort')) { return 'non_filter'; }
    else{ return queryParameters['sort']; }
  }

  bool _cacheDurationExceed({required String keyTime}){
    if(!deviceIsConnected) { return false; }
    else{
      final keyTimeValue = sharedPrefUseCase.getStringFromKey(keyTime)!;
      final cacheTime = DateTime.parse(keyTimeValue).millisecondsSinceEpoch;
      final currentTime = DateTime.now().millisecondsSinceEpoch;
      return ((currentTime - cacheTime) / (1000 * 60)) > kAppCacheTimeDuration;
    }
  }

  bool _isFromCache({required Map<String, dynamic> queryParameters}){
    final curKey = _generateKeyFromQueryParameters(queryParameters: queryParameters);
    final keyTime = '${curKey}_time';
    return !(sharedPrefUseCase.getStringFromKey(keyTime) == null || _cacheDurationExceed(keyTime: keyTime));
  }

  Future<bool> _saveResponseToStorage({required Map<String, dynamic> queryParameters, required String response}) async{
    final curKey = _generateKeyFromQueryParameters(queryParameters: queryParameters);
    final keyTime = '${curKey}_time';
    final keyValue = '${curKey}_value';
    final saveDateTime = await sharedPrefUseCase.setStringUsingKeyValue(key: keyTime, value: DateTime.now().toString());
    final saveResponse = await sharedPrefUseCase.setStringUsingKeyValue(key: keyValue, value: response);
    return saveDateTime & saveResponse;
  }

  @override
  Future<ScreenDataBundle> getListDataBundle({required Map<String, dynamic> queryParameters}) async{
    late final String? response;
    late final bool fromCache;
    //late final Map<String, dynamic> jsonObj;

    deviceIsConnected = await connectivityUseCase.deviceIsConnected;

    if(_isFromCache(queryParameters: queryParameters)){
      final curKey = _generateKeyFromQueryParameters(queryParameters: queryParameters);
      final keyValue = '${curKey}_value';
      response = sharedPrefUseCase.getStringFromKey(keyValue);
      fromCache = true;
    }else{
      try{
        final curRes = await dio.get(searchRepositoryEndPoint, queryParameters: queryParameters);
        final statusCode = curRes.statusCode;
        response = curRes.data;
        if(curRes.statusCode != 200){
          return Future.error('${json.decode(response!)['message']}, Response code: $statusCode');
        }
        else{ await _saveResponseToStorage(queryParameters: queryParameters, response: response!); }
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