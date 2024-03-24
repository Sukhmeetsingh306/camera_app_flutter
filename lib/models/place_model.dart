import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PlaceModel {
  final String id;
  final String title;
  final File image;
  final PlaceLocationModal location;

  PlaceModel({
    required this.location,
    required this.image,
    required this.title,
    String? id,
  }) : id = id ?? uuid.v4();
  // this id system wil replace the null id
}

class PlaceLocationModal {
  final double latitude;
  final double longitude;
  final String address;

  const PlaceLocationModal({
    required this.latitude,
    required this.longitude,
    required this.address,
  });
}
