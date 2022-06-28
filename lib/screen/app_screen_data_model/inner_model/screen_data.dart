import 'package:equatable/equatable.dart';
import '../../../api/model/inner_model/item.dart';
import 'data_for_details_screen.dart';
import 'data_for_list_screen.dart';

class ScreenData extends Equatable {
  final DataForListScreen dataForListScreen;
  final DataForDetailsScreen dataForDetailsScreen;

  factory ScreenData.fromItem(Item? item) {
    return ScreenData._(
        dataForListScreen: DataForListScreen(
          projectName: item?.name,
          language: item?.language,
          license: item?.license?.spdxId,
          dateTime: item?.updatedAt?.toString(),
          stars: item?.stargazersCount,
        ),
        dataForDetailsScreen: DataForDetailsScreen(
          ownersName: item?.owner?.login,
          photo: item?.owner?.avatarUrl,
          repDescription: item?.description,
          lastUpdateDateTime: item?.updatedAt?.toString(),
        ),
    );
  }

  const ScreenData._({required this.dataForListScreen, required this.dataForDetailsScreen});

  @override
  List<Object?> get props => [dataForListScreen, dataForDetailsScreen];
}
