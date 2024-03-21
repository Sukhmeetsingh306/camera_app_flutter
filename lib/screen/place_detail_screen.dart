import 'package:camera_flutter/models/place_model.dart';
import 'package:camera_flutter/theme/color_text_theme.dart';
import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({
    super.key,
    required this.placeModal,
  });

  final PlaceModel placeModal;

  String get locationImage {
    final lat = placeModal.location.latitude;
    final lng = placeModal.location.longitude;

    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng=&zoom=16&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:A%7C$lat,$lng&key=AIzaSyBfszrvr6tTGmMfarhe-QHTtzctpeT2mFA';
  }

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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(locationImage),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black54,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                    child: textTitleLargeOnBackgroundColor(
                      context,
                      placeModal.location.address,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
