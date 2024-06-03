import 'package:english_word_dictionary/app/infra/dtos/definition_dto.dart';

class MeaningDTO {
  MeaningDTO({
    required this.partOfSpeech,
    required this.definitions,
    required this.synonyms,
    required this.antonyms,
  });

  final String partOfSpeech;
  final List<DefinitionDTO> definitions;
  final List<String> synonyms;
  final List<String> antonyms;

  factory MeaningDTO.fromJson(dynamic json) {
    return MeaningDTO(
      partOfSpeech: json['partOfSpeech'],
      definitions: List<DefinitionDTO>.from(
          json['definitions'].map((x) => DefinitionDTO.fromJson(x))),
      synonyms: List<String>.from(json['synonyms'].map((x) => x)),
      antonyms: List<String>.from(json['antonyms'].map((x) => x)),
    );
  }
}
