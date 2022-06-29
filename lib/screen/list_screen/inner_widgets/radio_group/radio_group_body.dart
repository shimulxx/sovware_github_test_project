import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sovware_github_test_project/screen/list_screen/controller/list_screen_controller_cubit.dart';
import 'package:sovware_github_test_project/screen/list_screen/inner_widgets/radio_group/controller/radio_group_cubit.dart';
import 'package:sovware_github_test_project/screen/list_screen/inner_widgets/radio_group/controller/radio_group_cubit_state.dart';
import 'inner_widget/radio_button_widget.dart';

class RadioGroupBody extends StatelessWidget {
  const RadioGroupBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radioGroupCubit = context.read<RadioGroupCubit>();
    final listScreenCubit = context.read<ListScreenCubit>();
    return BlocBuilder<RadioGroupCubit, RadioGroupCubitState>(
      builder: (context, state){
       return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RadioButtonWidget(
              title: 'No Filter',
              value: 1,
              groupValue: state.curGroupValue,
              onChanged: (value){
                radioGroupCubit.onChangeGroup(selectedGroupValue: value, listScreenCubit: listScreenCubit);
              }
            ),
            RadioButtonWidget(
              title: 'Star Count',
              value: 2,
              groupValue: state.curGroupValue,
              onChanged: (value){
                radioGroupCubit.onChangeGroup(selectedGroupValue: value, listScreenCubit: listScreenCubit);
              }
            ),
            RadioButtonWidget(
              title: 'Updated',
              value: 3,
              groupValue: state.curGroupValue,
              onChanged: (value){
                radioGroupCubit.onChangeGroup(selectedGroupValue: value, listScreenCubit: listScreenCubit);
              }
            ),
          ],
        );
      },
    );
  }
}