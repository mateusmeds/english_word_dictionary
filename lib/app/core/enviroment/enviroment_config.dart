import 'package:english_word_dictionary/app/shared/dependencies/export.dart';

class EnviromentConfig {
  static Future<void> init() async {
    await dotenv.load(fileName: '.env');
  }
}
