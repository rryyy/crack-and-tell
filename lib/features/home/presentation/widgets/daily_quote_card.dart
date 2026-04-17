import 'package:crack_and_tell/theme/app_paddings.dart';
import 'package:crack_and_tell/theme/app_radius.dart';
import 'package:crack_and_tell/theme/app_spacing.dart';
import 'package:flutter/material.dart';

class DailyQuoteCard extends StatelessWidget {
  final String quote;
  final String author;

  const DailyQuoteCard({
    super.key,
    required this.quote,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.card,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.format_quote_outlined,
            color: Theme.of(context).colorScheme.primary,
            size: 50.0,
          ),
          Text(
            '"$quote"',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            "- $author",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}