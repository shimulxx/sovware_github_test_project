import 'package:equatable/equatable.dart';
import '../../api/model/inner_model/item.dart';
import 'inner_model/screen_data.dart';

class ScreenDataBundle extends Equatable{
  final bool fromCache;
  final bool deviceIsConnected;
  final List<ScreenData> listScreenData;

  const ScreenDataBundle._({required this.fromCache, required this.listScreenData, required this.deviceIsConnected});

  factory ScreenDataBundle.fromItemList({required bool fromCache, List<Item>? items, required bool deviceIsConnected}){
    return ScreenDataBundle._(
      fromCache: fromCache,
      deviceIsConnected: deviceIsConnected,
      listScreenData: items == null ? [] : items.map((e) => ScreenData.fromItem(e)).toList(),
    );
  }

  @override
  List<Object?> get props => [fromCache, listScreenData];
}





