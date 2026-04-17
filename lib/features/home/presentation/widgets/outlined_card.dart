import 'package:crack_and_tell/theme/app_paddings.dart';
import 'package:crack_and_tell/theme/app_radius.dart';
import 'package:flutter/material.dart';

class OutlinedCard extends StatelessWidget {
  final Widget child;
  final double? height;

  const OutlinedCard({required this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.card,
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: child,
    );
  }
}