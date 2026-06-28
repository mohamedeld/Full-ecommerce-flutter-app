part of 'choose_location_cubit.dart';

sealed class ChooseLocationState {}

final class ChooseLocationInitial extends ChooseLocationState {}

final class FetchingLocation extends ChooseLocationState {}

final class FetchedLocation extends ChooseLocationState {
  final List<LocationItemModel> locations;
  FetchedLocation({required this.locations});
}

final class AddingLocation extends ChooseLocationState {}

final class AddedLocation extends ChooseLocationState {}

final class ErrorLocation extends ChooseLocationState {
  final String message;
  ErrorLocation({required this.message});
}

final class ErrorAddingLocation extends ChooseLocationState {
  final String message;
  ErrorAddingLocation({required this.message});
}

final class LocationChosen extends ChooseLocationState {
  final LocationItemModel chosenLocation;

  LocationChosen(this.chosenLocation);
}

final class ConfirmLocationLoading extends ChooseLocationState {}

final class ConfirmLocationLoaded extends ChooseLocationState {}

final class ConfirmLocationError extends ChooseLocationState {
  final String message;

  ConfirmLocationError({required this.message});
}
