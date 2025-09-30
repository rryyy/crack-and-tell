abstract class DateRepository {
  Future<DateTime?> getLastSaveDate();
  Future<void> saveDate(DateTime date);
}