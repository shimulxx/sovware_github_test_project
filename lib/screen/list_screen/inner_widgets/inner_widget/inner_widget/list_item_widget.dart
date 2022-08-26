import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../app_constants/app_constants.dart';
import '../../../../app_screen_data_model/inner_model/data_for_list_screen.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({
    Key? key,
    required this.curListItem,
    required this.index,
  }) : super(key: key);

  final DataForListScreen curListItem;
  final int index;

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
                  Column(
                    children: [
                      Hero(
                        tag: index,
                        child: CachedNetworkImage(
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                          placeholder: (c, s){
                            return const Padding(
                              padding: EdgeInsets.all(15),
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorWidget:(context, url, error){
                            return Image.asset('assets/pngs/avatar_default.png');
                          },
                          imageUrl: curListItem.photoUrl ?? kAvatarDefaultPhoto,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text((index + 1).toString(), style: const TextStyle(fontWeight: FontWeight.bold),)
                    ],
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
                                maxLines: 1,
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