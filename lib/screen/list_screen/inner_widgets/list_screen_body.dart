import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app_constants/app_constants.dart';
import '../controller/list_screen_controller_cubit.dart';
import '../controller/list_screen_controller_cubit_state.dart';
import 'inner_widget/list_item_widget.dart';

class ListScreenBody extends StatelessWidget {
  const ListScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ListScreenCubit, ListScreenCubitState>(
        builder: (context, state) {
          if(state.isLoading) { return const Center(child: CircularProgressIndicator()); }
          else if(state.hasError) { return Center(child: Text(state.errorMessage)); }
          else {
            //print('is from cache: ${state.screenDataBundle?.fromCache}');
            final curScreenDataBundle = state.screenDataBundle?.listScreenData;
            if (curScreenDataBundle == null || curScreenDataBundle.isEmpty) { return const Text('No data found'); }
            else {
              return ListView.builder(
                key: ObjectKey(curScreenDataBundle[0]),
                shrinkWrap: true,
                itemCount: curScreenDataBundle.length,
                itemBuilder: (context, index) {
                  final curListItem = curScreenDataBundle[index].dataForListScreen;
                  final curDetailsItem = curScreenDataBundle[index].dataForDetailsScreen;
                  return GestureDetector(
                    onTap: () { Navigator.of(context).pushNamed(kGotoDetailsScreen, arguments: curDetailsItem); },
                    child: ListItemWidget(curListItem: curListItem),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}

