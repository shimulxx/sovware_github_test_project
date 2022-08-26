import 'package:flutter/material.dart';
import '../../../../app_constants/app_constants.dart';
import '../../../app_screen_data_model/inner_model/screen_data.dart';
import 'inner_widget/list_item_widget.dart';

class ListBodyWidget extends StatefulWidget {
  const ListBodyWidget({
    Key? key,
    required this.curScreenDataBundle,
    required this.reachAtBottom,
  }) : super(key: key);

  final List<ScreenData> curScreenDataBundle;
  final Function() reachAtBottom;

  @override
  State<ListBodyWidget> createState() => _ListBodyWidgetState();
}

class _ListBodyWidgetState extends State<ListBodyWidget>{

  late final ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels != 0) {
          widget.reachAtBottom.call();
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final curList = widget.curScreenDataBundle;
    final listLength = curList.length;
    return ListView.builder(
      controller: _controller,
      key: PageStorageKey(widget.curScreenDataBundle.hashCode),
      shrinkWrap: true,
      itemCount: listLength + 1,
      itemBuilder: (context, index) {
        if(listLength == index){
          return Container(
            alignment: Alignment.center,
            height: 100,
            child: const CircularProgressIndicator(strokeWidth: 2, color: Colors.deepPurple),
          );
        }
        final curListItem = curList[index].dataForListScreen;
        final curDetailsItem = curList[index].dataForDetailsScreen;
        return GestureDetector(
          onTap: () { Navigator.of(context).pushNamed(kGotoDetailsScreen, arguments: [curDetailsItem, index]); },
          child: ListItemWidget(curListItem: curListItem, index: index,),
        );
      },
    );
  }
}
