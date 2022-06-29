import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:sovware_github_test_project/api/model/github_list_response.dart';
import 'package:sovware_github_test_project/app_constants/app_constants.dart';
import 'package:sovware_github_test_project/app_store/shared_pref_use_case.dart';
import '../../screen/app_screen_data_model/screen_data_bundle_model.dart';

abstract class GitHubListRepository{
    Future<ScreenDataBundle> getListDataBundle({required Map<String, dynamic> queryParameters});
}

class GitHubListRepositoryImp implements GitHubListRepository{
  final Dio dio;
  final SharedPrefUseCase sharedPrefUseCase;

  GitHubListRepositoryImp({required this.dio, required this.sharedPrefUseCase});

  String _generateKeyFromQueryParameters({required Map<String, dynamic> queryParameters}){
    if(!queryParameters.containsKey('sort')) { return 'non_filter'; }
    else{ return queryParameters['sort']; }
  }

  bool _cacheDurationExceed({required String keyTime}){
    final keyTimeValue = sharedPrefUseCase.getStringFromKey(keyTime)!;
    final cacheTime = DateTime.parse(keyTimeValue).millisecondsSinceEpoch;
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    return ((currentTime - cacheTime) / (1000 * 60)) > kAppCacheTimeDuration;
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
    late final Map<String, dynamic> jsonObj;

    if(_isFromCache(queryParameters: queryParameters)){
      final curKey = _generateKeyFromQueryParameters(queryParameters: queryParameters);
      final keyValue = '${curKey}_value';
      response = sharedPrefUseCase.getStringFromKey(keyValue);
      jsonObj = json.decode(response!);
      fromCache = true;
    }else{
      try{
        final curRes = await dio.get(searchRepositoryEndPoint, queryParameters: queryParameters);
        final statusCode = curRes.statusCode;
        response = curRes.data;
        jsonObj = json.decode(response!);
        if(curRes.statusCode != 200){ return Future.error('${jsonObj['message']}, Response code: $statusCode'); }
        else{ await _saveResponseToStorage(queryParameters: queryParameters, response: response); }
      }
      catch(e){ return Future.error(e); }
      fromCache = false;
    }
    final details = GithubListResponse.fromMap(jsonObj);
    return ScreenDataBundle.fromItemList(fromCache: fromCache, items: details.items);
  }

}