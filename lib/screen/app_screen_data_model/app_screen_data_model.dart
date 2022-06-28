import '../../api/model/inner_model/item.dart';
import 'inner_model/screen_data.dart';

class ScreenDataBundle{
  final bool fromCache;
  final List<ScreenData> listScreenData;

  ScreenDataBundle._({required this.fromCache, required this.listScreenData});

  factory ScreenDataBundle.fromItemList({required bool fromCache, List<Item>? items}){
    return ScreenDataBundle._(
      fromCache: fromCache,
      listScreenData: items == null ? [] : items.map((e) => ScreenData.fromItem(e)).toList(),
    );
  }
}





