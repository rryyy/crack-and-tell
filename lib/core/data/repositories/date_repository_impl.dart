import 'package:crack_and_tell/core/domain/repositories/date_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DateRepositoryImpl implements DateRepository {
  static const _key = 'last_save_date';

  @override
  Future<DateTime?> getLastSaveDate() async {
    final prefs = await SharedPreferences.getInstance();
    final timestamp = prefs.getInt(_key);
    return timestamp != null ? DateTime.fromMillisecondsSinceEpoch(timestamp) : null;
  }

  @override
  Future<void> saveDate(DateTime date) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, date.millisecondsSinceEpoch);
  }
}