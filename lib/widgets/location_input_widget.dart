import 'package:camera_flutter/theme/color_theme.dart';
import 'package:flutter/material.dart';

class LocationInputWidget extends StatefulWidget {
  const LocationInputWidget({super.key});

  @override
  State<LocationInputWidget> createState() => _LocationInputWidgetState();
}

class _LocationInputWidgetState extends State<LocationInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          child: textBodyLargeOnBackgroundColor(context, 'No Location Added'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.location_on,
              ),
              label: const Text('Get Current  Location'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.map_outlined,
              ),
              label: const Text('Select on Map'),
            ),
          ],
        ),
      ],
    );
  }
}
