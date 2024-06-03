import 'package:english_word_dictionary/app/domain/entities/definition.dart';
import 'package:english_word_dictionary/app/infra/dtos/definition_dto.dart';

class DefinitionMapper {
  static Definition fromDTO(DefinitionDTO dto) {
    return Definition(
      definition: dto.definition,
      example: dto.example,
      synonyms: dto.synonyms,
      antonyms: dto.antonyms,
    );
  }
}
