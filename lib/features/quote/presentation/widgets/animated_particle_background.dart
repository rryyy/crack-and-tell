import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';


class AnimatedParticleBackground extends StatelessWidget {
  final TickerProvider vsync;
  final Widget child;

  const AnimatedParticleBackground({
    super.key, 
    required this.vsync, 
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      vsync: vsync, 
      behaviour: RandomParticleBehaviour(
        options: ParticleOptions(
          //baseColor: Theme.of(context).colorScheme.onSurfaceVariant,
          baseColor: Colors.white,
          spawnOpacity: 0.0,
          opacityChangeRate: 0.25,
          minOpacity: 0.1,
          maxOpacity: 0.4,
          spawnMinSpeed: 10.00,
          spawnMaxSpeed: 50.00,
          spawnMinRadius: 1.00,
          spawnMaxRadius: 50.00,
          particleCount: 20,
        )
      ),
      child: child
    );
  }
}