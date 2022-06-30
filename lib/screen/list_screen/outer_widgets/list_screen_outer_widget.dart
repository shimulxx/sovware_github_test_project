import 'package:flutter/material.dart';
import '../inner_widgets/inner_widget/status_body.dart';
import '../inner_widgets/list_screen_body.dart';
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
          SizedBox(height: 5,),
          StatusBody()
        ],
      )
    );
  }
}










