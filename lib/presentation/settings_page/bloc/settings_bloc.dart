import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/settings_item_model.dart';
import 'package:test/presentation/settings_page/models/settings_model.dart';
part 'settings_event.dart';
part 'settings_state.dart';

/// A bloc that manages the state of a Settings according to the event that is dispatched to it.
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(SettingsState initialState) : super(initialState) {
    on<SettingsInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SettingsInitialEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(
        settingsModelObj: state.settingsModelObj?.copyWith(
      settingsItemList: fillSettingsItemList(),
    )));
  }

  List<SettingsItemModel> fillSettingsItemList() {
    return [
      SettingsItemModel(
          heartrate: ImageConstant.imgTelevision,
          heartRate: "Heart rate",
          heartRateCount: "215bpm"),
      SettingsItemModel(
          heartrate: ImageConstant.imgSettings,
          heartRate: "Calories",
          heartRateCount: "756cal"),
      SettingsItemModel(
          heartrate: ImageConstant.imgThumbsUp,
          heartRate: "Weight",
          heartRateCount: "103lbs")
    ];
  }
}
