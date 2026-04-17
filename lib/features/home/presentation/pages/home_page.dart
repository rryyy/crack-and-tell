import 'package:crack_and_tell/features/home/presentation/widgets/daily_quote_card.dart';
import 'package:crack_and_tell/features/home/presentation/widgets/home_feature_grid.dart';
import 'package:crack_and_tell/features/home/presentation/widgets/home_greeting_header.dart';
import 'package:crack_and_tell/features/home/presentation/widgets/mood_checkin_card.dart';
import 'package:crack_and_tell/theme/app_paddings.dart';
import 'package:crack_and_tell/theme/app_spacing.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: AppPadding.tabBarScreen,
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeGreetingHeader(name: "John"),
              const SizedBox(height: AppSpacing.md),
              DailyQuoteCard(
                quote: "Your calm mind is the ultimate weapon agains your challengers.",
                author: "Bryant McGill"
              ),
              const SizedBox(height: AppSpacing.md),
              MoodCheckInCard(),
              const SizedBox(height: AppSpacing.md),
              HomeFeatureGrid(),
            ],
          )
          )
        )
      )
    );
  }
}