import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sovware_github_test_project/screen/app_screen_data_model/inner_model/data_for_list_screen.dart';
import '../../../app_constants/app_constants.dart';
import '../controller/list_screen_controller_cubit.dart';
import '../controller/list_screen_controller_cubit_state.dart';

class ListScreenBody extends StatelessWidget {
  const ListScreenBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ListScreenCubit, ListScreenCubitState>(
        builder: (context, state) {
          if(state.isLoading) { return const Center(child: CircularProgressIndicator()); }
          else if(state.hasError) { return Center(child: Text(state.errorMessage)); }
          else {
            //print('is from cache: ${state.screenDataBundle?.fromCache}');
            final curScreenDataBundle = state.screenDataBundle?.listScreenData;
            if (curScreenDataBundle == null || curScreenDataBundle.isEmpty) { return const Text('No data found'); }
            else {
              return ListView.builder(
                key: ObjectKey(curScreenDataBundle[0]),
                shrinkWrap: true,
                itemCount: curScreenDataBundle.length,
                itemBuilder: (context, index) {
                  final curListItem = curScreenDataBundle[index].dataForListScreen;
                  final curDetailsItem = curScreenDataBundle[index].dataForDetailsScreen;
                  return GestureDetector(
                    onTap: () { Navigator.of(context).pushNamed(kGotoDetailsScreen, arguments: curDetailsItem); },
                    child: NewWidget(curListItem: curListItem),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.curListItem,
  }) : super(key: key);

  final DataForListScreen curListItem;

  @override
  Widget build(BuildContext context) {
    const commonTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
    return AbsorbPointer(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Card(
          elevation: 3,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                    errorWidget:(context, url, error){
                      return CachedNetworkImage(
                        height: 50, width: 50,
                        imageUrl: kAvatarDefaultPhoto,
                      );
                    },
                    imageUrl: curListItem.photoUrl ?? kAvatarDefaultPhoto,
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text('${curListItem.projectName}',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),),
                            ),
                          ],
                        ),
                        Text('Language: ${curListItem.language}', style: commonTextStyle.copyWith(color: Colors.green),),
                        Text('License: ${curListItem.license},', style: commonTextStyle.copyWith(color: Colors.blue),),
                        Text('Date Time: ${curListItem.dateTime}', style: commonTextStyle.copyWith(color: const Color(0xff906F00))),
                        Text('☆: ${curListItem.stars}', style: commonTextStyle.copyWith(fontWeight: FontWeight.bold)),
                        //Text('${index + 1} ${curListItem.dateTime} ${curListItem.license} ${curListItem.language}, ${curListItem.projectName} ${curListItem.stars}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}