import 'package:camera_flutter/models/place_model.dart';
import 'package:camera_flutter/screen/place_detail_screen.dart';
import 'package:camera_flutter/theme/color_text_theme.dart';
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
        child: textBodyLargeOnBackgroundColor(
          context,
          'No Places Added Yet',
        ),
      );
    }

    return ListView.builder(
      itemCount: placeModal.length,
      itemBuilder: ((context, index) {
        return ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundImage: FileImage(
              placeModal[index].image,
            ),
          ),
          title: textTitleMediumOnBackgroundColor(
            context,
            placeModal[index].title,
          ),
          subtitle: textBodySmallOnBackgroundColor(
            context,
            placeModal[index].location.address,
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PlaceDetailScreen(
                  placeModal: placeModal[index],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
