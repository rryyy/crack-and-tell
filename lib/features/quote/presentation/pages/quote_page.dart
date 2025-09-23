
import 'package:crack_and_tell/features/quote/domain/entities/quote.dart';
import 'package:crack_and_tell/features/quote/domain/usecases/fetch_quote.dart';
import 'package:crack_and_tell/features/quote/presentation/widgets/animated_particle_background.dart';
import 'package:crack_and_tell/features/quote/presentation/widgets/quote_display.dart';
import 'package:crack_and_tell/injection_container.dart';
import 'package:flutter/material.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> with TickerProviderStateMixin{
  Quote? _quote;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchQuote();
  }

  Future<void> _fetchQuote() async {
    final getRandomQuote = sl<FetchQuote>();
    final result = await getRandomQuote();
    setState(() {
      _quote = result;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      body: AnimatedParticleBackground(
        vsync: this,
        child: Center(
          child: _isLoading 
          ? const CircularProgressIndicator()
          : QuoteDisplay(quote: _quote!)
        )
      )
    );
  }
}



