import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sovware_github_test_project/injection_container/injection_container.dart';
import '../../controller/list_screen_controller_cubit.dart';
import '../list_screen_body/list_screen_body.dart';
import '../radio_group/radio_group_body.dart';
import '../status_body/status_body.dart';

class ListScreenFullBodyWidget extends StatefulWidget {
  const ListScreenFullBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ListScreenFullBodyWidget> createState() => _ListScreenFullBodyWidgetState();
}

class _ListScreenFullBodyWidgetState extends State<ListScreenFullBodyWidget> {
  late final dynamic subscription;

  @override
  void initState() {
    subscription = getIt<Connectivity>().onConnectivityChanged.listen((ConnectivityResult result) {
      context.read<ListScreenCubit>().loadFirstPage();
    });
    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const[
        RadioGroupBody(),
        ListScreenBody(),
        SizedBox(height: 5,),
        StatusBody()
      ],
    );
  }
}