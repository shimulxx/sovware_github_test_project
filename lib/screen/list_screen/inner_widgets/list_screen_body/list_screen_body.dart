import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sovware_github_test_project/screen/list_screen/inner_widgets/inner_widget/error_widget_list.dart';
import '../../controller/list_screen_controller_cubit.dart';
import '../../controller/list_screen_controller_cubit_state.dart';
import '../inner_widget/list_body_widget.dart';

class ListScreenBody extends StatelessWidget {
  const ListScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ListScreenCubit>();
    return Expanded(
      child: BlocBuilder<ListScreenCubit, ListScreenCubitState>(
        builder: (context, state) {
          if (state.isLoading) { return const Center(child: CircularProgressIndicator()); }
          else if (state.hasError) { return ErrorWidgetForList(cubit: cubit); }
          else {
            final curScreenDataBundle = state.paginationList;
            if (curScreenDataBundle.isEmpty) { return const Text('No data found');}
            else {
              return ListBodyWidget(
                curScreenDataBundle: curScreenDataBundle,
                reachAtBottom: cubit.loadNextPage,
              );
            }
          }
        },
      ),
    );
  }
}


