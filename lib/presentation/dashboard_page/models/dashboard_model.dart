// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'thirtylist_item_model.dart';
import 'doctorlist_item_model.dart';

/// This class defines the variables used in the [dashboard_page],
/// and is typically used to hold data that is passed between different parts of the application.
class DashboardModel extends Equatable {
  DashboardModel({
    this.thirtylistItemList = const [],
    this.doctorlistItemList = const [],
  }) {}

  List<ThirtylistItemModel> thirtylistItemList;

  List<DoctorlistItemModel> doctorlistItemList;

  DashboardModel copyWith({
    List<ThirtylistItemModel>? thirtylistItemList,
    List<DoctorlistItemModel>? doctorlistItemList,
  }) {
    return DashboardModel(
      thirtylistItemList: thirtylistItemList ?? this.thirtylistItemList,
      doctorlistItemList: doctorlistItemList ?? this.doctorlistItemList,
    );
  }

  @override
  List<Object?> get props => [thirtylistItemList, doctorlistItemList];
}
