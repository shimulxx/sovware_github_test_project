import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sovware_github_test_project/screen/list_screen/controller/list_screen_controller_cubit.dart';
import 'package:sovware_github_test_project/screen/list_screen/inner_widgets/radio_group/controller/radio_group_cubit_state.dart';

class RadioGroupCubit extends Cubit<RadioGroupCubitState>{
  RadioGroupCubit() : super(const RadioGroupCubitState(curGroupValue: 1));

  void onChangeGroup({required int? selectedGroupValue, required ListScreenCubit listScreenCubit}){
    emit(state.copyWith(curGroupValue: selectedGroupValue));
    listScreenCubit.loadData(selectedGroupValue!);
  }

}