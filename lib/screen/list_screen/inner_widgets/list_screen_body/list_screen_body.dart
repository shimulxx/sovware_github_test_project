import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sovware_github_test_project/screen/app_screen_data_model/inner_model/screen_data.dart';
import '../../../../app_constants/app_constants.dart';
import '../../controller/list_screen_controller_cubit.dart';
import '../../controller/list_screen_controller_cubit_state.dart';
import '../inner_widget/list_item_widget.dart';

class ListScreenBody extends StatelessWidget {
  const ListScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ListScreenCubit>();
    return Expanded(
      child: BlocBuilder<ListScreenCubit, ListScreenCubitState>(
        builder: (context, state) {
          if(state.isLoading) { return const Center(child: CircularProgressIndicator()); }
          else if(state.hasError) { return Center(child: Text(state.errorMessage)); }
          else {
            //print('is from cache: ${state.screenDataBundle?.fromCache}');
            //final curScreenDataBundle = state.screenDataBundle?.listScreenData;
            final curScreenDataBundle = state.paginationList;
            if (curScreenDataBundle.isEmpty) { return const Text('No data found'); }
            else {
              return ListBodyWidget(
                curScreenDataBundle: curScreenDataBundle,
                reachAtBottom: cubit.loadNextPage,
              );
            }
          }
        },
      ),
    );
  }
}

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

class _ListBodyWidgetState extends State<ListBodyWidget> {

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
    return ListView.builder(
      controller: _controller,
      key: ObjectKey(widget.curScreenDataBundle[0]),
      shrinkWrap: true,
      itemCount: widget.curScreenDataBundle.length + 1,
      itemBuilder: (context, index) {
        if(widget.curScreenDataBundle.length == index){
          return Container(
            alignment: Alignment.center,
            height: 100,
            child: const CircularProgressIndicator(strokeWidth: 2, color: Colors.deepPurple,),
          );
        }
        final curListItem = widget.curScreenDataBundle[index].dataForListScreen;
        final curDetailsItem = widget.curScreenDataBundle[index].dataForDetailsScreen;
        return GestureDetector(
          onTap: () { Navigator.of(context).pushNamed(kGotoDetailsScreen, arguments: [curDetailsItem, index]); },
          child: ListItemWidget(curListItem: curListItem, index: index,),
        );
      },
    );
  }
}

