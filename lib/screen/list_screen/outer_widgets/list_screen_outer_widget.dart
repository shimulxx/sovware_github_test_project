import 'package:flutter/material.dart';
import '../inner_widgets/full_body/full_body_widget.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Screen'), centerTitle: true,),
      body: const FullBodyWidget()
    );
  }
}












