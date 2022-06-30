import 'package:equatable/equatable.dart';
import '../../../api/model/inner_model/item.dart';
import '../../../date_time/date_time_use_cases.dart';
import '../../../injection_container/injection_container.dart';

class DataForDetailsScreen extends Equatable{
  final String? ownersName;
  final String? photoUrl;
  final String? repDescription;
  final String? lastUpdateDateTime;

  factory DataForDetailsScreen.fromItem(Item? item){
    return DataForDetailsScreen._(
      ownersName: item?.owner?.login,
      photoUrl: item?.owner?.avatarUrl,
      repDescription: item?.description,
      lastUpdateDateTime: item?.updatedAt == null ? null : getIt<AppDateTimeFormatUseCase>().timeFromDateTime(dateTime: item!.updatedAt!),
    );
  }

  const DataForDetailsScreen._({this.lastUpdateDateTime, this.photoUrl, this.repDescription, this.ownersName});

  @override
  List<Object?> get props => [ownersName, photoUrl, repDescription, lastUpdateDateTime];
}