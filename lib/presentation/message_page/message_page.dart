import '../message_page/widgets/chatlist_item_widget.dart';
import 'bloc/message_bloc.dart';
import 'models/chatlist_item_model.dart';
import 'models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:test/core/app_export.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  MessagePageState createState() => MessagePageState();

  static Widget builder(BuildContext context) {
    return BlocProvider<MessageBloc>(
        create: (context) =>
            MessageBloc(MessageState(messageModelObj: MessageModel()))
              ..add(MessageInitialEvent()),
        child: MessagePage());
  }
}

class MessagePageState extends State<MessagePage>
    with AutomaticKeepAliveClientMixin<MessagePage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 31.v),
                  _buildChatList(context)
                ]))));
  }

  /// Section Widget
  Widget _buildChatList(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: BlocSelector<MessageBloc, MessageState, MessageModel?>(
            selector: (state) => state.messageModelObj,
            builder: (context, messageModelObj) {
              return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 24.v);
                  },
                  itemCount: messageModelObj?.chatlistItemList.length ?? 0,
                  itemBuilder: (context, index) {
                    ChatlistItemModel model =
                        messageModelObj?.chatlistItemList[index] ??
                            ChatlistItemModel();
                    return ChatlistItemWidget(model, onTapChat: () {
                      onTapChat(context);
                    });
                  });
            }));
  }

  /// Navigates to the chatScreen when the action is triggered.
  onTapChat(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.chatScreen,
    );
  }
}
