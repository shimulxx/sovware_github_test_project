import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sovware_github_test_project/api/model/github_list_response.dart';
import 'package:sovware_github_test_project/app_constants/app_constants.dart';

import '../../screen/app_screen_data_model/app_screen_data_model.dart';

abstract class GitHubListRepository{
    Future<ScreenDataBundle> getListDataBundle();
}

class GitHubListRepositoryImp implements GitHubListRepository{
  final Dio dio;

  GitHubListRepositoryImp(this.dio);

  @override
  Future<ScreenDataBundle> getListDataBundle() async{
    try{
      final response = await dio.get(searchRepositoryEndPoint);
      final jsonObj = json.decode(response.data);
      if (response.statusCode == 200) {
        final details = GithubListResponse.fromMap(jsonObj);
        return ScreenDataBundle.fromItemList(fromCache: true, items: details.items);
      }
      else {
        return Future.error('Something happened wrong! ${response.statusCode}');
      }
    }
    catch(e){
      return Future.error(e);
    }
  }

}