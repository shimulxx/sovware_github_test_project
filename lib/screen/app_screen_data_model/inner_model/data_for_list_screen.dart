import 'package:equatable/equatable.dart';
import 'package:sovware_github_test_project/api/model/inner_model/item.dart';
import 'package:sovware_github_test_project/injection_container/injection_container.dart';

import '../../../date_time/date_time_use_cases.dart';

class DataForListScreen extends Equatable{
  final String? projectName;
  final String? language;
  final String? license;
  final String? dateTime;
  final int? stars;
  final String? photoUrl;

  factory DataForListScreen.fromItem(Item? item){
    return DataForListScreen._(
      projectName: item?.name,
      language: item?.language,
      license: item?.license?.spdxId,
      dateTime: item?.pushedAt == null ? null : getIt<AppDateTimeFormatUseCase>().timeFromDateTime(dateTime: item!.pushedAt!),
      stars: item?.stargazersCount,
      photoUrl: item?.owner?.avatarUrl,
    );
  }

  const DataForListScreen._({this.dateTime, this.language, this.license, this.projectName, this.stars, this.photoUrl});

  @override
  List<Object?> get props => [projectName, language, license, dateTime, stars, photoUrl];
}