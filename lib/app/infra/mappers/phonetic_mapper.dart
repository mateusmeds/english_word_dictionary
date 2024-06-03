import 'package:english_word_dictionary/app/domain/entities/phonetic.dart';
import 'package:english_word_dictionary/app/infra/dtos/phonetic_dto.dart';

class PhoneticMapper {
  static Phonetic fromDTO(PhoneticDTO dto) {
    return Phonetic(
      text: dto.text,
      audio: dto.audio,
    );
  }
}
