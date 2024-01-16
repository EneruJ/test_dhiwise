import '../models/thirtylist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:test/core/app_export.dart';
import 'package:test/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ThirtylistItemWidget extends StatelessWidget {
  ThirtylistItemWidget(
    this.thirtylistItemModelObj, {
    Key? key,
    this.onTapBtnTicket,
  }) : super(
          key: key,
        );

  ThirtylistItemModel thirtylistItemModelObj;

  VoidCallback? onTapBtnTicket;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 71.h,
      child: CustomIconButton(
        height: 71.adaptSize,
        width: 71.adaptSize,
        padding: EdgeInsets.all(16.h),
        decoration: IconButtonStyleHelper.fillCyan,
        onTap: () {
          onTapBtnTicket!.call();
        },
        child: CustomImageView(
          imagePath: thirtylistItemModelObj?.ticket,
        ),
      ),
    );
  }
}
