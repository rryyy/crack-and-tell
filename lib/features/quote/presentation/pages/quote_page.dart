import 'package:animated_background/animated_background.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      body: AnimatedBackground(
        vsync: this, 
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
            baseColor: Theme.of(context).colorScheme.onSurfaceVariant,
            spawnOpacity: 0.0,
            opacityChangeRate: 0.25,
            minOpacity: 0.1,
            maxOpacity: 0.4,
            spawnMinSpeed: 10.00,
            spawnMaxSpeed: 50.00,
            spawnMinRadius: 1.00,
            spawnMaxRadius: 50.00,
            particleCount: 50,
          )
        ),
        child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2,
          // color: Theme.of(context).colorScheme.onSurfaceVariant,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AutoSizeText(
                'It is not uncommon for people to spend their whole life waiting to start living.', 
                maxLines: 10,
                minFontSize: 12,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 40, 
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              AutoSizeText(
                'John Doe', 
                maxLines: 1,
                minFontSize: 6,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12, 
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        )
      )
      )
    );
  }
}