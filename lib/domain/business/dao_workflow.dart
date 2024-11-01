import '../../hyrule.dart';

abstract class DaoWorkFlow {
  Future<List<Entry>> getSavedEntries();

  Future<void> saveEntry({
    required Entry entry,
  });

  Future<void> deleteEntry({
    required Entry entry,
  });
}
