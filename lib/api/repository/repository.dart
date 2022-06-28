import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:sovware_github_test_project/api/model/github_list_response.dart';
import 'package:sovware_github_test_project/app_constants/app_constants.dart';
import '../../screen/app_screen_data_model/screen_data_bundle_model.dart';

abstract class GitHubListRepository{
    Future<ScreenDataBundle> getListDataBundle({Map<String, dynamic>? queryParameters});
}

class GitHubListRepositoryImp implements GitHubListRepository{
  final Dio dio;

  GitHubListRepositoryImp({required this.dio});

  @override
  Future<ScreenDataBundle> getListDataBundle({Map<String, dynamic>? queryParameters}) async{
    print(queryParameters);
    try{
      final response = await dio.get(searchRepositoryEndPoint, queryParameters: queryParameters);
      final jsonObj = json.decode(response.data);
      final statusCode = response.statusCode;
      if (statusCode == 200) {
        final details = GithubListResponse.fromMap(jsonObj);
        return ScreenDataBundle.fromItemList(fromCache: true, items: details.items);
      }
      else {
        return Future.error('${jsonObj['message']}, Response code: $statusCode');
      }
    }
    catch(e){
      return Future.error(e);
    }
  }

}