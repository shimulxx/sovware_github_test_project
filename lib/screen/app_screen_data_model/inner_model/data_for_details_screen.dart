import 'package:equatable/equatable.dart';

import '../../../api/model/inner_model/item.dart';

class DataForDetailsScreen extends Equatable{
  final String? ownersName;
  final String? photo;
  final String? repDescription;
  final String? lastUpdateDateTime;

  factory DataForDetailsScreen.fromItem(Item? item){
    return DataForDetailsScreen._(
      ownersName: item?.owner?.login,
      photo: item?.owner?.avatarUrl,
      repDescription: item?.description,
      lastUpdateDateTime: item?.updatedAt?.toString(),
    );
  }

  const DataForDetailsScreen._({this.lastUpdateDateTime, this.photo, this.repDescription, this.ownersName});

  @override
  List<Object?> get props => [ownersName, photo, repDescription, lastUpdateDateTime];
}