import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sovware_github_test_project/app_constants/app_constants.dart';
import 'package:sovware_github_test_project/screen/list_screen/controller/list_screen_controller_cubit.dart';
import 'package:sovware_github_test_project/screen/list_screen/controller/list_screen_controller_cubit_state.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Screen')),
      body: BlocBuilder<ListScreenCubit, ListScreenCubitState>(
          builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.hasError) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          final curScreenDataBundle = state.screenDataBundle?.listScreenData;
          if (curScreenDataBundle == null || curScreenDataBundle.isEmpty) {
            return const Text('No data found');
          } else {
            return ListView.builder(
              itemCount: curScreenDataBundle.length,
              itemBuilder: (context, index) {
                final curListItem =
                    curScreenDataBundle[index].dataForListScreen;
                final curDetailsItem =
                    curScreenDataBundle[index].dataForDetailsScreen;
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(kGotoDetailsScreen,
                        arguments: curDetailsItem);
                  },
                  child: AbsorbPointer(
                    child: Card(
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Text(
                            '${index + 1} ${curListItem.dateTime} ${curListItem.license} ${curListItem.language}, ${curListItem.projectName} ${curListItem.stars}'),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        }
      }),
    );
  }
}
