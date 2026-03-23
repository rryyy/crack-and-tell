import 'package:crack_and_tell/core/data/enums/moods.dart';
import 'package:crack_and_tell/features/quote/presentation/pages/quote_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoodPage extends StatefulWidget {
  const MoodPage({ super.key });

  @override
  State<MoodPage> createState() => _MoodPageState();
}
class _MoodPageState extends State<MoodPage> {
  Moods? selectedMood;
  String? moodDescription;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'How are you feeling right now?',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: Moods.values.map((mood) => buildMoodIcon(mood)).toList()              
            ),
            const SizedBox(height: 80),
            Text(
              selectedMood?.description ?? '',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center            
            )
          ],
        ),
      ),
    );
  }

  //Widget buildMoodIcon(Widget svg) {
  Widget buildMoodIcon(Moods mood) {
    final bool isSelected = selectedMood == mood;
  
    final Widget svg = SvgPicture.asset(
      mood.assetName,
      colorFilter: ColorFilter.mode(
        isSelected ? Colors.blue : Colors.white,
        BlendMode.srcIn,
      ),
      semanticsLabel: 'This is a test',
    );

    return GestureDetector(
      onTap: () => onMoodSelected(mood),
      child: AnimatedScale(
        scale: isSelected ? 1.2 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 80, maxHeight: 80),
          child: svg
        )
      )
    );
  }

  void onMoodSelected(Moods mood) async {
    setState(() {
      selectedMood = mood;
    });

    await Future.delayed(const Duration(milliseconds: 700));

    if (!mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuotePage(mood: mood)
      )
    );

    setState(() {
      selectedMood = null;
    });
  }
}