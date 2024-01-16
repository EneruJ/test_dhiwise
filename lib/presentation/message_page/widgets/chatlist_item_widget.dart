import '../models/chatlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:test/core/app_export.dart';

// ignore: must_be_immutable
class ChatlistItemWidget extends StatelessWidget {
  ChatlistItemWidget(
    this.chatlistItemModelObj, {
    Key? key,
    this.onTapChat,
  }) : super(
          key: key,
        );

  ChatlistItemModel chatlistItemModelObj;

  VoidCallback? onTapChat;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapChat!.call();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: chatlistItemModelObj?.drMarcusHorizon,
            height: 50.adaptSize,
            width: 50.adaptSize,
            radius: BorderRadius.circular(
              25.h,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 15.h,
                top: 5.v,
                bottom: 5.v,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chatlistItemModelObj.drMarcusHorizon1!,
                          style: theme.textTheme.titleMedium,
                        ),
                        SizedBox(height: 4.v),
                        Text(
                          chatlistItemModelObj.iDonTHaveAny!,
                          style: CustomTextStyles.bodySmallBluegray600,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 13.h,
                      top: 3.v,
                      bottom: 4.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chatlistItemModelObj.time!,
                          style: CustomTextStyles.bodySmallOnPrimary,
                        ),
                        SizedBox(height: 7.v),
                        CustomImageView(
                          imagePath: ImageConstant.imgCheckmark,
                          height: 9.v,
                          width: 14.h,
                          alignment: Alignment.centerRight,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
