import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sovware_github_test_project/screen/app_screen_data_model/inner_model/data_for_details_screen.dart';
import '../../../app_constants/app_constants.dart';

class DetailsScreen extends StatelessWidget {
  final DataForDetailsScreen dataForDetailsScreen;
  final int index;
  const DetailsScreen({
    Key? key,
    required this.dataForDetailsScreen,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const commonTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen'), centerTitle: true,),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 4,
            child: SizedBox(
              width: 350,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10,),
                  Hero(
                    tag: index,
                    child: CachedNetworkImage(
                      height: 250,
                      width: 250,
                      fit: BoxFit.cover,
                      errorWidget:(context, url, error){
                        return CachedNetworkImage(
                          height: 250, width: 250,
                          imageUrl: kAvatarDefaultPhoto,
                        );
                      },
                      imageUrl: dataForDetailsScreen.photoUrl ?? kAvatarDefaultPhoto,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text('Owner Name: ${dataForDetailsScreen.ownersName}', style: const TextStyle(color: Colors.lightGreen, fontWeight: FontWeight.bold, fontSize: 20), textAlign: TextAlign.center,),
                  const SizedBox(height: 10,),
                  Text('Date Time: ${dataForDetailsScreen.lastUpdateDateTime}', style: commonTextStyle.copyWith(color: const Color(0xff906F00)), textAlign: TextAlign.center,),
                  const SizedBox(height: 10,),
                  SizedBox(
                    width: 300,
                    child: Text('Description: ${dataForDetailsScreen.repDescription}', style: commonTextStyle.copyWith(color: Colors.black),textAlign: TextAlign.center,),
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
