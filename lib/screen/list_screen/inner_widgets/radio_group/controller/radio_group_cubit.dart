import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sovware_github_test_project/app_store/shared_pref_use_case.dart';
import 'package:sovware_github_test_project/screen/list_screen/controller/list_screen_controller_cubit.dart';
import 'package:sovware_github_test_project/screen/list_screen/inner_widgets/radio_group/controller/radio_group_cubit_state.dart';

class RadioGroupCubit extends Cubit<RadioGroupCubitState>{
  final SharedPrefUseCase sharedPrefUseCase;

  RadioGroupCubit({required this.sharedPrefUseCase}) : super(RadioGroupCubitState(curGroupValue: sharedPrefUseCase.getRadioValue()));

  void onChangeGroup({required int? selectedGroupValue, required ListScreenCubit listScreenCubit}) async{
    emit(state.copyWith(curGroupValue: selectedGroupValue));
    if(await sharedPrefUseCase.setRadioValueSucceeded(selectedGroupValue!)){
      listScreenCubit.loadData();
    }
  }

}