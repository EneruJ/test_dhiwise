import '../../../core/app_export.dart';

/// This class is used in the [chatlist_item_widget] screen.
class ChatlistItemModel {
  ChatlistItemModel({
    this.drMarcusHorizon,
    this.drMarcusHorizon1,
    this.iDonTHaveAny,
    this.time,
    this.id,
  }) {
    drMarcusHorizon = drMarcusHorizon ?? ImageConstant.imgProfileThumbnail;
    drMarcusHorizon1 = drMarcusHorizon1 ?? "Dr. Marcus Horizon";
    iDonTHaveAny = iDonTHaveAny ?? "I don,t have any fever, but headchace...";
    time = time ?? "10.24";
    id = id ?? "";
  }

  String? drMarcusHorizon;

  String? drMarcusHorizon1;

  String? iDonTHaveAny;

  String? time;

  String? id;
}
