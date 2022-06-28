import 'package:equatable/equatable.dart';
import 'package:sovware_github_test_project/api/model/inner_model/item.dart';

class DataForListScreen extends Equatable{
  final String? projectName;
  final String? language;
  final String? license;
  final String? dateTime;
  final int? stars;

  factory DataForListScreen.fromItem(Item? item){
    return DataForListScreen._(
      projectName: item?.name,
      language: item?.language,
      license: item?.license?.spdxId,
      dateTime: item?.updatedAt?.toString(),
      stars: item?.stargazersCount,
    );
  }

  const DataForListScreen._({this.dateTime, this.language, this.license, this.projectName, this.stars});

  @override
  List<Object?> get props => [projectName, language, license, dateTime, stars];
}