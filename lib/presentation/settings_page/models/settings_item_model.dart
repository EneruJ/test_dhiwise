import '../../../core/app_export.dart';

/// This class is used in the [settings_item_widget] screen.
class SettingsItemModel {
  SettingsItemModel({
    this.heartrate,
    this.heartRate,
    this.heartRateCount,
    this.id,
  }) {
    heartrate = heartrate ?? ImageConstant.imgTelevision;
    heartRate = heartRate ?? "Heart rate";
    heartRateCount = heartRateCount ?? "215bpm";
    id = id ?? "";
  }

  String? heartrate;

  String? heartRate;

  String? heartRateCount;

  String? id;
}
