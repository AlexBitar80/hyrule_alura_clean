import '../../hyrule.dart';

abstract class ApiWorkFlow {
  Future<List<Entry>> getEntriesByCategory({
    required String category,
  });
}
