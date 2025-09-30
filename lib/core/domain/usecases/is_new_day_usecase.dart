import 'package:crack_and_tell/core/domain/repositories/date_repository.dart';
import 'package:flutter/widgets.dart';

class IsNewDayUsecase {
  final DateRepository repository;

  IsNewDayUsecase(this.repository);

  Future<bool> execute() async {
    final lastSaveDate = await repository.getLastSaveDate();
    debugPrint("lastSaveDate: $lastSaveDate");
    final today = DateTime.now();
    debugPrint("today: $today");

    if (lastSaveDate == null) {
      await repository.saveDate(today);
      return true;
    }

    final isNewDay = !_isSameDay(lastSaveDate, today);

    debugPrint("isNewDay: $isNewDay");

    if (isNewDay) {
      await repository.saveDate(today);
    }

    return isNewDay;
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}