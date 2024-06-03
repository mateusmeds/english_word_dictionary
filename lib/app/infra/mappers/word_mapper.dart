import 'package:english_word_dictionary/app/domain/entities/word.dart';
import 'package:english_word_dictionary/app/infra/dtos/word_dto.dart';
import 'package:english_word_dictionary/app/infra/mappers/meaning_mapper.dart';
import 'package:english_word_dictionary/app/infra/mappers/phonetic_mapper.dart';

class WordMapper {
  static Word fromDTO(WordDTO dto) => Word(
        word: dto.word,
        phonetics: dto.phonetics.map((e) => PhoneticMapper.fromDTO(e)).toList(),
        meanings: dto.meanings.map((e) => MeaningMapper.fromDTO(e)).toList(),
        phonetic: dto.phonetic,
      );
}
