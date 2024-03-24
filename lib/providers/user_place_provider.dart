import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

import '../models/place_model.dart';

class UserPlaceProviderNotifier extends StateNotifier<List<PlaceModel>> {
  UserPlaceProviderNotifier() : super(const []);

  void addPlaceUserProvider(
      String title, File image, PlaceLocationModal location)  async{
    //code for the path to store the data on to the device
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName =  path.basename(image.path);
    final copyImage = await image.copy('${appDir.path}/$fileName');

    final newPlace = PlaceModel(
      title: title,
      image: copyImage,
      location: location,
    );
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
