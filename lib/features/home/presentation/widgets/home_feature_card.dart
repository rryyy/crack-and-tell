import 'package:crack_and_tell/features/home/data/models/home_feature_item.dart';
import 'package:crack_and_tell/features/home/presentation/widgets/outlined_card.dart';
import 'package:crack_and_tell/theme/app_spacing.dart';
import 'package:flutter/material.dart';

class HomeFeatureCard extends StatelessWidget {
  final HomeFeatureItem item;

  const HomeFeatureCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return OutlinedCard(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            item.icon,
            color: Theme.of(context).colorScheme.primary,
            size: 30.0,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(item.title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          Text(item.subtitle, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}