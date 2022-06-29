import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sovware_github_test_project/app_constants/app_constants.dart';
import 'package:sovware_github_test_project/injection_container/injection_container.dart';
import 'package:sovware_github_test_project/screen/app_screen_data_model/inner_model/data_for_details_screen.dart';
import 'package:sovware_github_test_project/screen/details_screen/ui/details_screen_ui.dart';
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
                  create: (context) => getIt<ListScreenCubit>()..loadData(),
                ),
                BlocProvider(
                  create: (context) => getIt<RadioGroupCubit>(),
                ),
              ],
              child: const ListScreen(),
          )
        );
      case kGotoDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => DetailsScreen(dataForDetailsScreen: (settings.arguments as DataForDetailsScreen)),
        );
      default: return null;
    }
  }
}