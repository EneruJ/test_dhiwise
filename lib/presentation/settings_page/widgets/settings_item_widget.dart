import '../models/settings_item_model.dart';
import 'package:flutter/material.dart';
import 'package:test/core/app_export.dart';

// ignore: must_be_immutable
class SettingsItemWidget extends StatelessWidget {
  SettingsItemWidget(
    this.settingsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SettingsItemModel settingsItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 63.h,
      child: Column(
        children: [
          CustomImageView(
            imagePath: settingsItemModelObj?.heartrate,
            height: 32.adaptSize,
            width: 32.adaptSize,
          ),
          SizedBox(height: 5.v),
          Text(
            settingsItemModelObj.heartRate!,
            style: CustomTextStyles.labelMediumCyan100,
          ),
          SizedBox(height: 4.v),
          Text(
            settingsItemModelObj.heartRateCount!,
            style: CustomTextStyles.titleMediumPrimary_1,
          ),
        ],
      ),
    );
  }
}
