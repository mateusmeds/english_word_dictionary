import 'package:english_word_dictionary/app/infra/dtos/meaning_dto.dart';
import 'package:english_word_dictionary/app/infra/dtos/phonetic_dto.dart';

class WordDTO {
  WordDTO({
    required this.word,
    required this.phonetics,
    required this.meanings,
    this.phonetic,
  });

  final String word;
  final String? phonetic;
  final List<MeaningDTO> meanings;
  final List<PhoneticDTO> phonetics;

  factory WordDTO.fromJson(List<dynamic> json) {
    final fisrt = json.first;
    return WordDTO(
      word: fisrt['word'],
      phonetic: fisrt['phonetic'],
      meanings: List<MeaningDTO>.from(
          fisrt['meanings'].map((x) => MeaningDTO.fromJson(x))),
      phonetics: List<PhoneticDTO>.from(
          fisrt['phonetics'].map((x) => PhoneticDTO.fromJson(x))),
    );
  }
}
