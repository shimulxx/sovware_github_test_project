import 'package:flutter/material.dart';
import 'package:sovware_github_test_project/screen/list_screen/controller/list_screen_controller_cubit.dart';
import 'package:sovware_github_test_project/screen/list_screen/inner_widgets/radio_group/controller/radio_group_cubit.dart';
import '../inner_widgets/list_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../inner_widgets/radio_group/radio_group_body.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Screen')),
      body: Column(
        children: const[
           RadioGroupBody(),
           ListScreenBody(),
        ],
      )
    );
  }
}






