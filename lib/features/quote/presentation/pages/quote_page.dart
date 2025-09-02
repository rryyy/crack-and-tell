
import 'package:crack_and_tell/features/quote/domain/entities/quote.dart';
import 'package:crack_and_tell/features/quote/presentation/widgets/animated_particle_background.dart';
import 'package:crack_and_tell/features/quote/presentation/widgets/quote_display.dart';
import 'package:flutter/material.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      body: AnimatedParticleBackground(
        vsync: this,
        child: Center(
          child: QuoteDisplay(
            quote: const Quote(
              text: "The best way to predict the future is to invent it.",
              author: "Alan Kay"
            ) 
          )
        )
      )
    );
  }
}



