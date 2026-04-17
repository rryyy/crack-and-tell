import 'package:crack_and_tell/features/home/presentation/widgets/outlined_card.dart' show OutlinedCard;
import 'package:crack_and_tell/theme/app_spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoodCheckInCard extends StatelessWidget {
  const MoodCheckInCard({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            CupertinoIcons.heart_circle_fill,
            color: Theme.of(context).colorScheme.primary,
            size: 30.0,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'How are you feeling today?',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Tap here to open the mood selection screen',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}