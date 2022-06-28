import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sovware_github_test_project/screen/list_screen/controller/list_screen_controller_cubit_state.dart';
import '../../../api/controller_use_cases/controller_use_cases.dart';

class ListScreenCubit extends Cubit<ListScreenCubitState>{
  final GetListDataBundleUseCase getListDataBundleUseCase;

  ListScreenCubit({required this.getListDataBundleUseCase})
      : super(const ListScreenCubitState(isLoading: false, hasError: false, errorMessage: ''));

  void loadData() async{
    emit(state.copyWith(isLoading: true));
    try{
      final screenDataBundle = await getListDataBundleUseCase.getListDataBundle(queryParameters: {'q': 'flutter', 'per_page': '50'});
      emit(state.copyWith(isLoading: false, hasError: false, screenDataBundle: screenDataBundle));
    }
    catch(e){
      final currentErrorMessage = e.toString();
      emit(state.copyWith(isLoading: false, hasError: true, errorMessage: currentErrorMessage));
    }
  }

}