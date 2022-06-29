import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sovware_github_test_project/app_store/shared_pref_use_case.dart';
import 'package:sovware_github_test_project/screen/list_screen/controller/list_screen_controller_cubit_state.dart';
import '../../../api/controller_use_cases/controller_use_cases.dart';

class ListScreenCubit extends Cubit<ListScreenCubitState>{
  final GetListDataBundleUseCase getListDataBundleUseCase;
  final SharedPrefUseCase sharedPrefUseCase;

  ListScreenCubit({required this.getListDataBundleUseCase, required this.sharedPrefUseCase})
      : super(const ListScreenCubitState(isLoading: false, hasError: false, errorMessage: ''));

  Map<String, dynamic> _getDefaultMap(){ return {'q': 'flutter', 'per_page': '50'}; }

  Map<String, dynamic> _generateQueryAccordingSharedPrefValue() {
    final val = sharedPrefUseCase.getRadioValue();
    final mp = _getDefaultMap();
    if(val == 2) { mp['sort'] = 'stars'; }
    else if(val == 3) { mp['sort'] = 'updated'; }
    return mp;
  }

  Future<void> loadData() async{
    emit(state.copyWith(isLoading: true));
    try{
      final screenDataBundle = await getListDataBundleUseCase.getListDataBundle(queryParameters: _generateQueryAccordingSharedPrefValue());
      emit(state.copyWith(isLoading: false, hasError: false, screenDataBundle: screenDataBundle));
    }
    catch(e){
      final currentErrorMessage = e.toString();
      emit(state.copyWith(isLoading: false, hasError: true, errorMessage: currentErrorMessage));
    }
  }

}