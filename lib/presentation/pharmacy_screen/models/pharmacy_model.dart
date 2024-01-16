// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'drugs_item_model.dart';
import 'drugs1_item_model.dart';

/// This class defines the variables used in the [pharmacy_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class PharmacyModel extends Equatable {
  PharmacyModel({
    this.drugsItemList = const [],
    this.drugs1ItemList = const [],
  }) {}

  List<DrugsItemModel> drugsItemList;

  List<Drugs1ItemModel> drugs1ItemList;

  PharmacyModel copyWith({
    List<DrugsItemModel>? drugsItemList,
    List<Drugs1ItemModel>? drugs1ItemList,
  }) {
    return PharmacyModel(
      drugsItemList: drugsItemList ?? this.drugsItemList,
      drugs1ItemList: drugs1ItemList ?? this.drugs1ItemList,
    );
  }

  @override
  List<Object?> get props => [drugsItemList, drugs1ItemList];
}
