// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'settings_item_model.dart';

/// This class defines the variables used in the [settings_page],
/// and is typically used to hold data that is passed between different parts of the application.
class SettingsModel extends Equatable {
  SettingsModel({this.settingsItemList = const []}) {}

  List<SettingsItemModel> settingsItemList;

  SettingsModel copyWith({List<SettingsItemModel>? settingsItemList}) {
    return SettingsModel(
      settingsItemList: settingsItemList ?? this.settingsItemList,
    );
  }

  @override
  List<Object?> get props => [settingsItemList];
}
