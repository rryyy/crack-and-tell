import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Column(
            children: [
              Text(
                "Good morning, Sarah",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
              Text(
                "Start with a quick check-in to get today's quote and log your mood",
                style: Theme.of(context).textTheme.bodyLarge,
              
              )
            ],
          )
        )
      )
    );
  }
}