import 'package:equatable/equatable.dart';
import '../../app_screen_data_model/app_screen_data_model.dart';

class ListScreenCubitState extends Equatable{
  final bool isLoading;
  final bool hasError;
  final ScreenDataBundle? screenDataBundle;
  final String errorMessage;

  const ListScreenCubitState({required this.isLoading, required this.hasError, this.screenDataBundle, required this.errorMessage});

  ListScreenCubitState copyWith({
    bool? isLoading,
    bool? hasError,
    ScreenDataBundle? screenDataBundle,
    String? errorMessage
  }){
    return ListScreenCubitState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
      screenDataBundle: screenDataBundle ?? this.screenDataBundle,
    );
  }

  @override
  List<Object?> get props => [ isLoading, hasError, screenDataBundle, errorMessage ];

}