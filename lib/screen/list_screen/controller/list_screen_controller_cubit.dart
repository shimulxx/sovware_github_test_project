import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sovware_github_test_project/app_store/shared_pref_use_case.dart';
import 'package:sovware_github_test_project/screen/list_screen/controller/list_screen_controller_cubit_state.dart';
import '../../../api/controller_use_cases/controller_use_cases.dart';

class ListScreenCubit extends Cubit<ListScreenCubitState>{
  final GetListDataBundleUseCase getListDataBundleUseCase;
  final SharedPrefUseCase sharedPrefUseCase;

  late int pageNumber;

  ListScreenCubit({required this.getListDataBundleUseCase, required this.sharedPrefUseCase})
      : super(ListScreenCubitState(isLoading: false, hasError: false, errorMessage: '', paginationList: []));

  Map<String, dynamic> _getDefaultMap(){ return {'q': 'flutter', 'per_page': 10, 'page': pageNumber}; }

  Map<String, dynamic> _generateQueryAccordingSharedPrefValue() {
    final val = sharedPrefUseCase.getRadioValue();
    final mp = _getDefaultMap();
    if(val == 2) { mp['sort'] = 'stars'; }
    else if(val == 3) { mp['sort'] = 'updated'; }
    return mp;
  }


  void loadFirstPage(){
    pageNumber = 1;
    _loadData();
  }

  void loadNextPage(){
    ++pageNumber;
    _loadData();
  }

  Future<void> _loadData() async{
    if(pageNumber == 1) state.paginationList.clear();
    emit(state.copyWith(isLoading: pageNumber == 1));
    try{
      final screenDataBundle = await getListDataBundleUseCase.getListDataBundle(queryParameters: _generateQueryAccordingSharedPrefValue());
      //print('bundle: $screenDataBundle');
      emit(state.copyWith(
        isLoading: false,
        hasError: false,
        screenDataBundle: screenDataBundle,
        paginationList: state.paginationList..addAll(screenDataBundle.listScreenData)
      ));
    }
    catch(e){
      final currentErrorMessage = e.toString();
      emit(state.copyWith(isLoading: false, hasError: true, errorMessage: currentErrorMessage));
    }
  }

}