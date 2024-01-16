// ignore_for_file: must_be_immutable

part of 'dr_details_bloc.dart';

/// Represents the state of DrDetails in the application.
class DrDetailsState extends Equatable {
  DrDetailsState({
    this.selectedDatesFromCalendar1,
    this.drDetailsModelObj,
  });

  DrDetailsModel? drDetailsModelObj;

  DateTime? selectedDatesFromCalendar1;

  @override
  List<Object?> get props => [
        selectedDatesFromCalendar1,
        drDetailsModelObj,
      ];
  DrDetailsState copyWith({
    DateTime? selectedDatesFromCalendar1,
    DrDetailsModel? drDetailsModelObj,
  }) {
    return DrDetailsState(
      selectedDatesFromCalendar1:
          selectedDatesFromCalendar1 ?? this.selectedDatesFromCalendar1,
      drDetailsModelObj: drDetailsModelObj ?? this.drDetailsModelObj,
    );
  }
}
