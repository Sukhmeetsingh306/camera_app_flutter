import 'package:flutter/material.dart';

Text textBodyLargeOnBackgroundColor(BuildContext context, String text) {
  return Text(
    text,
    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
  );
}
