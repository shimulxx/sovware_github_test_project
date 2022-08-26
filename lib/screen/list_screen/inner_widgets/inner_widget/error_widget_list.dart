import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/list_screen_controller_cubit.dart';

class ErrorWidgetForList extends StatelessWidget {
  const ErrorWidgetForList({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final ListScreenCubit cubit;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ListScreenCubit>();
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              cubit.state.errorMessage,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 40,
              width: 160,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: MaterialButton(
                  color: Colors.red.withOpacity(0.75),
                  onPressed: cubit.reloadCurrentPageOnError,
                  child: const Text('Retry', style: TextStyle(color: Colors.white, fontSize: 17)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}