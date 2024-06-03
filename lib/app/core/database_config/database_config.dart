import 'package:english_word_dictionary/app/shared/dependencies/export.dart'
    show Hive, getApplicationDocumentsDirectory;

class DatabaseConfig {
  static Future<void> init() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
  }
}
