import 'package:equatable/equatable.dart';

class RadioGroupCubitState extends Equatable{
  final int curGroupValue;

  const RadioGroupCubitState({required this.curGroupValue});

  RadioGroupCubitState copyWith({int? curGroupValue}){
    return RadioGroupCubitState(curGroupValue: curGroupValue ?? this.curGroupValue);
  }

  @override
  List<Object?> get props => [curGroupValue];

}