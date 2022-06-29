import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefUseCase{
  Future<bool> setRadioValueSucceeded(int val);
  int getRadioValue();
}

class SharedPrefUseCaseImp implements SharedPrefUseCase{

  SharedPreferences sharedPreferences;

  static const key = 'radioValue';

  SharedPrefUseCaseImp({required this.sharedPreferences});

  @override
  int getRadioValue() {
    return sharedPreferences.getInt(key) ?? 1;
  }

  @override
  Future<bool> setRadioValueSucceeded(int val) {
    return sharedPreferences.setInt(key, val);
  }

}