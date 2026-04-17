import 'package:flutter/material.dart';

class HomeGreetingHeader extends StatelessWidget {
  final String name;

  const HomeGreetingHeader({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Good morning, $name",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Text(
          "Start with a quick check-in to get today's quote and log your mood",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}