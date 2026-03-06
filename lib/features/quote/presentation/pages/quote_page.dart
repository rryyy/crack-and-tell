import 'package:crack_and_tell/core/data/enums/moods.dart';
import 'package:crack_and_tell/features/quote/presentation/pages/quote_page_viewmodel.dart';
import 'package:crack_and_tell/features/quote/presentation/widgets/animated_particle_background.dart';
import 'package:crack_and_tell/features/quote/presentation/widgets/quote_display.dart';
import 'package:crack_and_tell/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuotePage extends StatefulWidget {
  final Moods? mood;

  const QuotePage({super.key, this.mood});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> with TickerProviderStateMixin{
  late final QuoteViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = sl<QuoteViewModel>();

    // if (widget.mood != null) {
    //   _viewModel.fetchRandomQuote(widget.mood!.tags);
    // } else {
    //   _viewModel.fetchRandomQuote(null);
    // }
    _viewModel.fetchRandomQuote(widget.mood?.tags);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _viewModel,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        backgroundColor: _viewModel.backgroundColor,
        body: AnimatedParticleBackground(
          vsync: this,
          child: Center(
            child: Consumer<QuoteViewModel>(
              builder: (context, viewModel, child) {
                return viewModel.isLoading 
                  ? const CircularProgressIndicator()
                  : QuoteDisplay(quote: viewModel.quote!);
              }
            )
          )
        )
      )
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}



