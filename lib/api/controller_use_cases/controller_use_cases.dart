import 'package:sovware_github_test_project/api/repository/repository.dart';
import '../../screen/app_screen_data_model/screen_data_bundle_model.dart';

abstract class GetListDataBundleUseCase{
  Future<ScreenDataBundle> getListDataBundle({required Map<String, dynamic> queryParameters});
}

class GetListDataBundleUseCaseImp implements GetListDataBundleUseCase{

  final GitHubListRepository gitHubListRepository;

  GetListDataBundleUseCaseImp({required this.gitHubListRepository});

  @override
  Future<ScreenDataBundle> getListDataBundle({required Map<String, dynamic> queryParameters}) {
    return gitHubListRepository.getListDataBundle(queryParameters: queryParameters);
  }

}