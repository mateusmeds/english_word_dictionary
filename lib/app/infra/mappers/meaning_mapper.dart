import 'package:english_word_dictionary/app/domain/entities/meaning.dart';
import 'package:english_word_dictionary/app/infra/dtos/meaning_dto.dart';
import 'package:english_word_dictionary/app/infra/mappers/definition_mapper.dart';

class MeaningMapper {
  static Meaning fromDTO(MeaningDTO dto) {
    return Meaning(
      partOfSpeech: dto.partOfSpeech,
      definitions:
          dto.definitions.map((e) => DefinitionMapper.fromDTO(e)).toList(),
      antonyms: dto.antonyms,
      synonyms: dto.synonyms,
    );
  }
}
