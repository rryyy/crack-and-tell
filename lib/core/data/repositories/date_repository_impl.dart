import 'package:crack_and_tell/core/domain/repositories/date_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DateRepositoryImpl implements DateRepository {
  static const _key = 'last_save_date';
  final SharedPreferences _prefs;

  DateRepositoryImpl(this._prefs);

  @override
  Future<DateTime?> getLastSaveDate() async {
    final timestamp = _prefs.getInt(_key);
    return timestamp != null ? DateTime.fromMillisecondsSinceEpoch(timestamp) : null;
  }

  @override
  Future<void> saveDate(DateTime date) async {
    await _prefs.setInt(_key, date.millisecondsSinceEpoch);
  }
}