import 'package:camera_flutter/models/place_model.dart';
import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({
    super.key,
    required this.placeModal,
  });

  final PlaceModel placeModal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          placeModal.title,
        ),
      ),
      body: Stack(
        children: [
          Image.file(
            placeModal.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ],
      ),
    );
  }
}
