import 'package:flutter/material.dart';

class LocationInputScreen extends StatefulWidget {
  const LocationInputScreen({super.key});

  @override
  State<LocationInputScreen> createState() => _LocationInputScreenState();
}

class _LocationInputScreenState extends State<LocationInputScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        Row(
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.location_on,
              ),
              label: const Text('Get Current  Location'),
            )
          ],
        ),
      ],
    );
  }
}
