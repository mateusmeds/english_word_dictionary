import 'package:english_word_dictionary/app/shared/dependencies/export.dart'
    show HiveObject, HiveField;

abstract class BaseEntity extends HiveObject {
  @HiveField(0)
  int? get id => key;
}
