import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:sovware_github_test_project/injection_container/injection_container.dart';


abstract class ConnectivityUseCase{
  Future<bool> get deviceIsConnected;
}

class ConnectivityUseCaseImp implements ConnectivityUseCase{

  Future<bool> _getDeviceConnectionStatus() async{
    final ConnectivityResult connectivityResult = await getIt.getAsync<ConnectivityResult>();
    return connectivityResult == ConnectivityResult.mobile
        || connectivityResult == ConnectivityResult.wifi
        || connectivityResult == ConnectivityResult.ethernet;
  }

  @override
  Future<bool> get deviceIsConnected => _getDeviceConnectionStatus();
}