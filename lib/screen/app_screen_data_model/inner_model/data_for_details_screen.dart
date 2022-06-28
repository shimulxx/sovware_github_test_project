import 'package:equatable/equatable.dart';

class DataForDetailsScreen extends Equatable{
  final String? ownersName;
  final String? photo;
  final String? repDescription;
  final String? lastUpdateDateTime;

  const DataForDetailsScreen({this.lastUpdateDateTime, this.photo, this.repDescription, this.ownersName});

  @override
  List<Object?> get props => [ownersName, photo, repDescription, lastUpdateDateTime];
}