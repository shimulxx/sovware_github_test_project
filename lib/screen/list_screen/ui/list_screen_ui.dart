import 'package:flutter/material.dart';
import 'package:sovware_github_test_project/screen/list_screen/controller/list_screen_controller_cubit.dart';
import '../inner_widgets/list_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listScreenCubit = context.read<ListScreenCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('List Screen')),
      body: RefreshIndicator(
        onRefresh: listScreenCubit.loadData,
        child: const ListScreenBody(),
      )
    );
  }
}


