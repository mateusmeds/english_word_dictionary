import 'package:english_word_dictionary/app/domain/entities/base_entity.dart';
import 'package:english_word_dictionary/app/shared/dependencies/export.dart';

part 'definition.g.dart';

@HiveType(typeId: 3)
class Definition extends BaseEntity {
  Definition({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
    this.example,
  });

  @HiveField(1)
  final String definition;
  @HiveField(2)
  final List<String> synonyms;
  @HiveField(3)
  final List<String> antonyms;
  @HiveField(4)
  final String? example;
}
