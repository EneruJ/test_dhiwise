// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'chatlist_item_model.dart';

/// This class defines the variables used in the [message_page],
/// and is typically used to hold data that is passed between different parts of the application.
class MessageModel extends Equatable {
  MessageModel({this.chatlistItemList = const []}) {}

  List<ChatlistItemModel> chatlistItemList;

  MessageModel copyWith({List<ChatlistItemModel>? chatlistItemList}) {
    return MessageModel(
      chatlistItemList: chatlistItemList ?? this.chatlistItemList,
    );
  }

  @override
  List<Object?> get props => [chatlistItemList];
}
