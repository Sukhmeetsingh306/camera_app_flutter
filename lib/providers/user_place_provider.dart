import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/place_model.dart';

class UserPlaceProviderNotifier extends StateNotifier<List<PlaceModel>> {
  UserPlaceProviderNotifier() : super(const []);

  void addPlaceUserProvider(String title,File image) {
    final newPlace = PlaceModel(title: title,image: image);
    state = [
      ...state,
      newPlace
    ]; // ...state this will update the state and not delete the old data
  }
}

final userPlaceProvider =
    StateNotifierProvider<UserPlaceProviderNotifier, List<PlaceModel>>(
  (ref) => UserPlaceProviderNotifier(),
);
