import 'dart:math';

extension RandomListExtension<T> on List<T> {
  List<T> randomSubset({int min = 1}) {
    final random = Random();

    if (isEmpty) return [];

    final shuffled = List<T>.from(this)..shuffle(random);
    final count = min + random.nextInt(length - min + 1);
    return shuffled.take(count).toList();
  }
}