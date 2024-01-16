// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'drlist_item_model.dart';

/// This class defines the variables used in the [dr_list_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DrListModel extends Equatable {
  DrListModel({this.drlistItemList = const []}) {}

  List<DrlistItemModel> drlistItemList;

  DrListModel copyWith({List<DrlistItemModel>? drlistItemList}) {
    return DrListModel(
      drlistItemList: drlistItemList ?? this.drlistItemList,
    );
  }

  @override
  List<Object?> get props => [drlistItemList];
}
