import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sovware_github_test_project/app_constants/app_constants.dart';
import 'package:sovware_github_test_project/injection_container/injection_container.dart';
import '../screen/details_screen/widgets/details_screen_ui.dart';
import '../screen/list_screen/controller/list_screen_controller_cubit.dart';
import '../screen/list_screen/inner_widgets/radio_group/controller/radio_group_cubit.dart';
import '../screen/list_screen/outer_widgets/list_screen_outer_widget.dart';

class AppRouter{
  Route? onGenerateRoute(RouteSettings settings) {
    debugPrint(settings.name.toString());

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => getIt<ListScreenCubit>()..loadFirstPage(),
                ),
                BlocProvider(
                  create: (context) => getIt<RadioGroupCubit>(),
                ),
              ],
              child: const ListScreen(),
          )
        );
      case kGotoDetailsScreen:
        final list = settings.arguments as List<dynamic>;
        final curData = list[0];
        final index = list[1];
        return MaterialPageRoute(
          builder: (context) => DetailsScreen(dataForDetailsScreen: curData, index: index),
        );
      default: return null;
    }
  }
}