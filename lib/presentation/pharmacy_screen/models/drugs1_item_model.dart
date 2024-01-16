import '../../../core/app_export.dart';

/// This class is used in the [drugs1_item_widget] screen.
class Drugs1ItemModel {
  Drugs1ItemModel({
    this.oBHCombi,
    this.panadol,
    this.measurement,
    this.price,
    this.facebook,
    this.id,
  }) {
    oBHCombi = oBHCombi ?? ImageConstant.imgDrugThumbnail1;
    panadol = panadol ?? "OBH Combi";
    measurement = measurement ?? "75ml";
    price = price ?? "9.99";
    facebook = facebook ?? ImageConstant.imgFacebookPrimary;
    id = id ?? "";
  }

  String? oBHCombi;

  String? panadol;

  String? measurement;

  String? price;

  String? facebook;

  String? id;
}
