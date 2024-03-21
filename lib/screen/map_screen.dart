import 'package:camera_flutter/models/place_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.placeLocationModal = const PlaceLocationModal(
      latitude: 37.422,
      longitude: -122.084,
      address: '',
    ),
    this.isSelected = true,
  });

  final PlaceLocationModal placeLocationModal;
  final bool isSelected;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isSelected ? 'Pick Your Location' : 'Your Location'),
        actions: [
          if (widget.isSelected)
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.save,
              ),
            ),
        ],
      ),
      body: GoogleMap(
        onTap: (position) {
          setState(() {
            _pickedLocation = position;
          });
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.placeLocationModal.latitude,
            widget.placeLocationModal.longitude,
          ),
          zoom: 16,
        ),
        markers: (_pickedLocation == null && widget.isSelected)
            ? {}
            : {
                Marker(
                  markerId: const MarkerId('m1'), // these id must be unique
                  position: _pickedLocation != null
                      ? _pickedLocation!
                      : LatLng(
                          widget.placeLocationModal.latitude,
                          widget.placeLocationModal.longitude,
                        ),
                ),
              }, // in {} we create the set in flutter
      ),
    );
  }
}
