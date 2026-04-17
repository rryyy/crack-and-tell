import 'package:crack_and_tell/features/home/data/models/home_feature_item.dart';
import 'package:crack_and_tell/features/home/presentation/widgets/home_feature_card.dart';
import 'package:crack_and_tell/theme/app_spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeFeatureGrid extends StatelessWidget {
  const HomeFeatureGrid({super.key});

  static const List<HomeFeatureItem> _features = [
    HomeFeatureItem(
      icon: CupertinoIcons.pencil_outline,
      title: 'Journal',
      subtitle: 'Write about today',
    ),
    HomeFeatureItem(
      icon: CupertinoIcons.wind,
      title: 'Breathe',
      subtitle: 'Find your center',
    ),
    HomeFeatureItem(
      icon: Icons.headset_outlined,
      title: 'Sounds',
      subtitle: 'Calm your mind',
    ),
    HomeFeatureItem(
      icon: Icons.insights_outlined,
      title: 'Insights',
      subtitle: 'Your mood trends',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final rows = [_features.sublist(0, 2), _features.sublist(2, 4)];

    return Column(
      children: rows
          .map(
            (rowItems) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Row(
                children: rowItems
                    .expand(
                      (item) => [
                        Expanded(child: HomeFeatureCard(item: item)),
                        if (item != rowItems.last)
                          const SizedBox(width: AppSpacing.md),
                      ],
                    )
                    .toList(),
              ),
            ),
          )
          .toList(),
    );
  }
}