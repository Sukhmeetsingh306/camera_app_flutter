import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

import '../models/place_model.dart';

class UserPlaceProviderNotifier extends StateNotifier<List<PlaceModel>> {
  UserPlaceProviderNotifier() : super(const []);

  void addPlaceUserProvider(
      String title, File image, PlaceLocationModal location) async {
    //code for the path to store the data on to the device
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final copyImage = await image.copy('${appDir.path}/$fileName');

    final newPlace = PlaceModel(
      title: title,
      image: copyImage,
      location: location,
    );

// with this the database is created
    final dbPath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT,  image TEXT, lat REAL, lng REAL, address TEXT)',
        );
      },
      version:
          1, // increase the number every time when the query is changed as the new database get created
    );

// with this we will insert the value in the database and create new elements
    db.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'lat': newPlace.location.latitude,
      'lng': newPlace.location.longitude,
      'address': newPlace.location.address,
    });

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
