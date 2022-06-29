import 'package:connectivity_plus/connectivity_plus.dart';


abstract class ConnectivityUseCase{
  Future<bool> get deviceIsConnected;
}

class ConnectivityUseCaseImp implements ConnectivityUseCase{

  Future<bool> _getDeviceConnectionStatus() async{
    final ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.mobile
        || connectivityResult == ConnectivityResult.wifi
        || connectivityResult == ConnectivityResult.ethernet;
  }

  @override
  Future<bool> get deviceIsConnected => _getDeviceConnectionStatus();
}