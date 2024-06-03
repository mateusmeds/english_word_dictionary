import 'package:english_word_dictionary/app/domain/entities/base_entity.dart';
import 'package:english_word_dictionary/app/domain/entities/definition.dart';
import 'package:english_word_dictionary/app/shared/dependencies/export.dart';

part 'meaning.g.dart';

@HiveType(typeId: 2)
class Meaning extends BaseEntity {
  Meaning({
    required this.partOfSpeech,
    required this.definitions,
    required this.synonyms,
    required this.antonyms,
  });

  @HiveField(1)
  final String partOfSpeech;
  @HiveField(2)
  final List<Definition> definitions;
  @HiveField(3)
  final List<String> synonyms;
  @HiveField(4)
  final List<String> antonyms;
}
