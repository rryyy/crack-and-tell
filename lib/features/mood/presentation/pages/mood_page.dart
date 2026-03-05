import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoodPage extends StatelessWidget {
  const MoodPage({super.key});
  
  @override
  Widget build(BuildContext context) {

    const String assetName = 'assets/images/mood/happy.svg';
    final Widget svg = SvgPicture.asset(
      assetName,
      colorFilter: const ColorFilter.mode(
        Colors.white,
        BlendMode.srcIn,
      ),
      semanticsLabel: 'This is a test',
    );

    const String assetName2 = 'assets/images/mood/sad.svg';
    final Widget svg2 = SvgPicture.asset(
      assetName2,
      colorFilter: const ColorFilter.mode(
        Colors.white,
        BlendMode.srcIn,
      ),
      semanticsLabel: 'This is a test',
    );

    const String assetName3 = 'assets/images/mood/angry.svg';
    final Widget svg3 = SvgPicture.asset(
      assetName3,
      colorFilter: const ColorFilter.mode(
        Colors.white,
        BlendMode.srcIn,
      ),
      semanticsLabel: 'This is a test',
    );

    const String assetName4 = 'assets/images/mood/overwhelmed.svg';
    final Widget svg4 = SvgPicture.asset(
      assetName4,
      colorFilter: const ColorFilter.mode(
        Colors.white,
        BlendMode.srcIn,
      ),
      semanticsLabel: 'This is a test',
    );

    const String assetName5 = 'assets/images/mood/confused.svg';
    final Widget svg5 = SvgPicture.asset(
      assetName5,
      colorFilter: const ColorFilter.mode(
        Colors.white,
        BlendMode.srcIn,
      ),
      semanticsLabel: 'This is a test',
    );

    const String assetName6 = 'assets/images/mood/inspired.svg';
    final Widget svg6 = SvgPicture.asset(
      assetName6,
      colorFilter: const ColorFilter.mode(
        Colors.white,
        BlendMode.srcIn,
      ),
      semanticsLabel: 'This is a test',
    );

    const String assetName7 = 'assets/images/mood/calm.svg';
    final Widget svg7 = SvgPicture.asset(
      assetName7,
      colorFilter: const ColorFilter.mode(
        Colors.white,
        BlendMode.srcIn,
      ),
      semanticsLabel: 'This is a test',
    );
    


    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'How are you feeling today?',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildMoodIcon(svg),
                const SizedBox(width: 20),
                buildMoodIcon(svg2),
                const SizedBox(width: 20),
                buildMoodIcon(svg3),
                const SizedBox(width: 20),
                buildMoodIcon(svg4),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildMoodIcon(svg5),
                const SizedBox(width: 20),
                buildMoodIcon(svg6),
                const SizedBox(width: 20),
                buildMoodIcon(svg7),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildMoodIcon(Widget svg) {
    return Flexible(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 70, maxHeight: 70),
        child: svg
      )
    );
  }
}