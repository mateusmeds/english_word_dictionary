import 'package:english_word_dictionary/app/domain/entities/base_entity.dart';
import 'package:english_word_dictionary/app/shared/dependencies/export.dart';

part 'phonetic.g.dart';

@HiveType(typeId: 1)
class Phonetic extends BaseEntity {
  Phonetic({
    required this.text,
    required this.audio,
  });

  @HiveField(1)
  final String text;
  @HiveField(2)
  final String audio;
}
