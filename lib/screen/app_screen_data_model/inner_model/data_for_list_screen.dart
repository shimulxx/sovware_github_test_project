import 'package:equatable/equatable.dart';

class DataForListScreen extends Equatable{
  final String? projectName;
  final String? language;
  final String? license;
  final String? dateTime;
  final int? stars;

  const DataForListScreen({this.dateTime, this.language, this.license, this.projectName, this.stars});

  @override
  List<Object?> get props => [projectName, language, license, dateTime, stars];
}