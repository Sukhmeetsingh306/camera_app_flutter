import 'package:camera_flutter/models/place_model.dart';
import 'package:flutter/material.dart';

class PlaceListWidget extends StatelessWidget {
  const PlaceListWidget({
    super.key,
    required this.placeModal,
  });

  final List<PlaceModel> placeModal;

  @override
  Widget build(BuildContext context) {
    if (placeModal.isEmpty) {
      return Center(
        child: Text(
          'No Places Added Yet',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }

    return ListView.builder(
      itemCount: placeModal.length,
      itemBuilder: ((context, index) {
        return ListTile(
          title: Text(
            placeModal[index].title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        );
      }),
    );
  }
}
