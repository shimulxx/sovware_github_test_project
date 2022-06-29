import 'package:flutter/material.dart';
import 'package:sovware_github_test_project/screen/app_screen_data_model/inner_model/data_for_details_screen.dart';

class DetailsScreen extends StatelessWidget {
  final DataForDetailsScreen dataForDetailsScreen;
  const DetailsScreen({Key? key, required this.dataForDetailsScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen'), centerTitle: true,),
      body: Center(
        child: Text('${dataForDetailsScreen.lastUpdateDateTime} ${dataForDetailsScreen.repDescription} ${dataForDetailsScreen.ownersName}, ${dataForDetailsScreen.photoUrl}'),
      ),
    );
  }
}
