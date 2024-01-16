// ignore_for_file: must_be_immutable

part of 'ambulance_bloc.dart';

/// Represents the state of Ambulance in the application.
class AmbulanceState extends Equatable {
  AmbulanceState({this.ambulanceModelObj});

  AmbulanceModel? ambulanceModelObj;

  @override
  List<Object?> get props => [
        ambulanceModelObj,
      ];
  AmbulanceState copyWith({AmbulanceModel? ambulanceModelObj}) {
    return AmbulanceState(
      ambulanceModelObj: ambulanceModelObj ?? this.ambulanceModelObj,
    );
  }
}
