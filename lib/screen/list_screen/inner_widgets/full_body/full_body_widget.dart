import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/list_screen_controller_cubit.dart';
import '../list_screen_body/list_screen_body.dart';
import '../radio_group/radio_group_body.dart';
import '../status_body/status_body.dart';

class FullBodyWidget extends StatefulWidget {
  const FullBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FullBodyWidget> createState() => _FullBodyWidgetState();
}

class _FullBodyWidgetState extends State<FullBodyWidget> {
  late final dynamic subscription;

  @override
  void initState() {
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
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