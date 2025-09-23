import 'package:crack_and_tell/features/quote/domain/entities/quote.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class QuoteDisplay extends StatelessWidget {
  final Quote quote;

  const QuoteDisplay({
    super.key, 
    required this.quote
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      // color: Theme.of(context).colorScheme.onSurfaceVariant,
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AutoSizeText(
            quote.quote, 
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
            quote.author, 
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
    );
  }
}