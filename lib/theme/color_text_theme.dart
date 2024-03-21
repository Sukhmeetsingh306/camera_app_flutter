import 'package:flutter/material.dart';

Text textBodyLargeOnBackgroundColor(BuildContext context, String text) {
  return Text(
    text,
    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
  );
}

Text textBodySmallOnBackgroundColor(BuildContext context, String text) {
  return Text(
    text,
    style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
  );
}

Text textTitleLargeOnBackgroundColor(
    BuildContext context, String text) {
  return Text(
    text,
    style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
  );
}

Text textTitleMediumOnBackgroundColor(BuildContext context, String text) {
  return Text(
    text,
    style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
  );
}
