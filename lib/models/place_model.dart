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
  }) : id = uuid.v4();
}

class PlaceLocationModal {
  final double latitude;
  final double longitude;
  final double address;

  PlaceLocationModal({
    required this.latitude,
    required this.longitude,
    required this.address,
  });
}
