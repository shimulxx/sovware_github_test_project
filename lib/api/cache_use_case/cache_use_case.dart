import 'package:sovware_github_test_project/app_store/shared_pref_use_case.dart';
import '../../app_constants/app_constants.dart';

abstract class CacheUseCase{
  bool isFromCache({required bool isConnected, required Map<String, dynamic> queryParameters});
  String? getResponseFromCache({required Map<String, dynamic> queryParameters});
  Future<bool> saveResponseToCache({required Map<String, dynamic> queryParameters, required String response});
}

class CacheUseCaseImp implements CacheUseCase{

  CacheUseCaseImp({required this.sharedPrefUseCase});

  final SharedPrefUseCase sharedPrefUseCase;

  String _generateKeyFromQueryParameters({required Map<String, dynamic> queryParameters}){
    final pageNumber = queryParameters['page'];
    if(!queryParameters.containsKey('sort')) { return 'non_filter_$pageNumber'; }
    else{ return '${queryParameters['sort']}_$pageNumber'; }
  }

  bool _cacheDurationExceed({required String keyTime, required bool isConnected}){
    if(!isConnected) { return false; }
    else{
      final keyTimeValue = sharedPrefUseCase.getStringFromKey(keyTime)!;
      final cacheTime = DateTime.parse(keyTimeValue).millisecondsSinceEpoch;
      final currentTime = DateTime.now().millisecondsSinceEpoch;
      return ((currentTime - cacheTime) / (1000 * 60)) > kAppCacheTimeDuration;
    }
  }

  @override
  String? getResponseFromCache({required Map<String, dynamic> queryParameters}){
    final curKey = _generateKeyFromQueryParameters(queryParameters: queryParameters);
    final keyValue = '${curKey}_value';
    return sharedPrefUseCase.getStringFromKey(keyValue);
  }

  @override
  bool isFromCache({required bool isConnected, required Map<String, dynamic> queryParameters}){
    final curKey = _generateKeyFromQueryParameters(queryParameters: queryParameters);
    final keyTime = '${curKey}_time';
    return !(sharedPrefUseCase.getStringFromKey(keyTime) == null || _cacheDurationExceed(keyTime: keyTime, isConnected: isConnected));
  }

  @override
  Future<bool> saveResponseToCache({required Map<String, dynamic> queryParameters, required String response}) async{
    final curKey = _generateKeyFromQueryParameters(queryParameters: queryParameters);
    final keyTime = '${curKey}_time';
    final keyValue = '${curKey}_value';
    final saveDateTime = await sharedPrefUseCase.setStringUsingKeyValue(key: keyTime, value: DateTime.now().toString());
    final saveResponse = await sharedPrefUseCase.setStringUsingKeyValue(key: keyValue, value: response);
    return saveDateTime & saveResponse;
  }
}