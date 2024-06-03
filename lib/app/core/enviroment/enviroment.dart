import 'package:english_word_dictionary/app/shared/dependencies/export.dart'
    show dotenv;

class Enviroment {
  static String get apiBaseUrl => _getValue('API_BASE_URL');

  static String _getValue(String name) => dotenv.get(name);
}
