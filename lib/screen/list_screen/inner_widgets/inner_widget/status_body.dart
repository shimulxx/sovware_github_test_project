import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/list_screen_controller_cubit.dart';
import '../../controller/list_screen_controller_cubit_state.dart';

class CenterText extends StatelessWidget {
  const CenterText({Key? key, required this.text, this.color})
      : super(key: key);

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: TextAlign.center, style: TextStyle(color: color, fontSize: 25, fontWeight: FontWeight.bold),);
  }
}

class StatusBody extends StatelessWidget {
  const StatusBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: BlocBuilder<ListScreenCubit, ListScreenCubitState>(
            builder: (context, state){
              if(state.isLoading){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CenterText(text: 'Loading..'),
                    SizedBox(width: 5,),
                    CenterText(text: 'Loading..'),
                  ],
                );
              }
              else if(state.hasError){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CenterText(text: 'Error!', color: Colors.red,),
                    SizedBox(width: 5,),
                    CenterText(text: 'Error!', color: Colors.red,),
                  ],
                );
              }
              else{
                final bundle = state.screenDataBundle;
                if(bundle == null) { return const CenterText(text: 'No data found!'); }
                else{
                  final isConnected = bundle.deviceIsConnected;
                  final fromCache = bundle.fromCache;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      isConnected
                          ? const CenterText(text: 'Connected', color: Colors.green,)
                          : const CenterText(text: 'Disconnected', color: Colors.red,),
                      const SizedBox(width: 5,),
                      fromCache
                          ? const CenterText(text: 'Cached', color: Colors.green,)
                          : const CenterText(text: 'From Net', color: Colors.blue,),
                    ],
                  );
                }
              }
            },
          ),
        ),
      ],
    );
  }
}