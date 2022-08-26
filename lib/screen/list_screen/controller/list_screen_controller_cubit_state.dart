import 'package:equatable/equatable.dart';
import '../../app_screen_data_model/inner_model/screen_data.dart';
import '../../app_screen_data_model/screen_data_bundle_model.dart';

class ListScreenCubitState extends Equatable{
  final bool isLoading;
  final bool hasError;
  final ScreenDataBundle? screenDataBundle;
  final String errorMessage;
  final List<ScreenData> paginationList;

  const ListScreenCubitState({
    required this.isLoading,
    required this.hasError,
    this.screenDataBundle,
    required this.errorMessage,
    this.paginationList = const [],
  });

  ListScreenCubitState copyWith({
    bool? isLoading,
    bool? hasError,
    ScreenDataBundle? screenDataBundle,
    String? errorMessage,
    List<ScreenData>? paginationList,
  }){
    return ListScreenCubitState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
      screenDataBundle: screenDataBundle ?? this.screenDataBundle,
      paginationList: paginationList ?? this.paginationList,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    hasError,
    screenDataBundle,
    errorMessage,
    paginationList,
  ];

}