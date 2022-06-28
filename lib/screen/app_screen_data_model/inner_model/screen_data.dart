import 'package:equatable/equatable.dart';
import '../../../api/model/inner_model/item.dart';
import 'data_for_details_screen.dart';
import 'data_for_list_screen.dart';

class ScreenData extends Equatable {
  final DataForListScreen dataForListScreen;
  final DataForDetailsScreen dataForDetailsScreen;

  factory ScreenData.fromItem(Item? item) {
    return ScreenData._(
      dataForListScreen: DataForListScreen.fromItem(item),
      dataForDetailsScreen: DataForDetailsScreen.fromItem(item),
    );
  }

  const ScreenData._({required this.dataForListScreen, required this.dataForDetailsScreen});

  @override
  List<Object?> get props => [dataForListScreen, dataForDetailsScreen];
}
