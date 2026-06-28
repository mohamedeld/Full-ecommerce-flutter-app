import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/models/location_item_model.dart';

part 'choose_location_state.dart';

class ChooseLocationCubit extends Cubit<ChooseLocationState> {
  ChooseLocationCubit() : super(ChooseLocationInitial());
  String selectedLocationId = dummyLocations.first.id;
  void fetchLocations() {
    emit(FetchingLocation());
    Future.delayed(Duration(seconds: 1), () {
      emit(FetchedLocation(locations: dummyLocations));
    });
  }

  void addLocation(String location) {
    emit(AddingLocation());
    Future.delayed(Duration(seconds: 1), () {
      final city = location.split(' ')[0];
      final country = location.split(' ')[1];
      final locationItem = LocationItemModel(
        id: DateTime.now().toIso8601String(),
        city: city,
        country: country,
      );
      dummyLocations.add(locationItem);
      emit(AddedLocation());
      emit(FetchedLocation(locations: dummyLocations));
    });
  }

  void chosenLocation(String id) {
    selectedLocationId = id;

    var chosenItem = dummyLocations.firstWhere(
      (item) => item.id == id,
      orElse: () => dummyLocations.first,
    );

    emit(LocationChosen(chosenItem));
  }

  void confirmChosenLocation() {
    emit(ConfirmLocationLoading());
    Future.delayed(Duration(seconds: 1), () {
      for (int i = 0; i < dummyLocations.length; i++) {
        if (dummyLocations[i].isChosen == true) {
          dummyLocations[i] = dummyLocations[i].copyWith(isChosen: false);
        }
        if (dummyLocations[i].id == selectedLocationId) {
          dummyLocations[i] = dummyLocations[i].copyWith(isChosen: true);
        }
      }
      emit(ConfirmLocationLoaded());
    });
  }
}
