import 'package:camera_flutter/providers/user_place_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:camera_flutter/screen/add_place_screen.dart';
import 'package:camera_flutter/widgets/place_list_widget.dart';

class PlaceListScreen extends ConsumerWidget {
  const PlaceListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaceProviderInScreen = ref.watch(userPlaceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Place'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddPlaceScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlaceListWidget(
          placeModal: userPlaceProviderInScreen,
        ),
      ),
    );
  }
}
