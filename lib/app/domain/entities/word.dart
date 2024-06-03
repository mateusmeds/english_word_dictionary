import 'package:english_word_dictionary/app/domain/entities/base_entity.dart';
import 'package:english_word_dictionary/app/domain/entities/meaning.dart';
import 'package:english_word_dictionary/app/domain/entities/phonetic.dart';
import 'package:english_word_dictionary/app/shared/dependencies/export.dart';

part 'word.g.dart';

@HiveType(typeId: 0)
class Word extends BaseEntity {
  Word({
    required this.word,
    required this.phonetics,
    required this.meanings,
    this.phonetic,
    DateTime? lastTimeReaded,
    bool isFavorited = false,
  })  : _lastTimeReaded = lastTimeReaded,
        _isFavorited = isFavorited;

  @HiveField(1)
  final String word;
  @HiveField(2)
  final String? phonetic;
  @HiveField(3)
  final List<Phonetic> phonetics;
  @HiveField(4)
  final List<Meaning> meanings;
  @HiveField(5)
  bool _isFavorited;
  @HiveField(6)
  DateTime? _lastTimeReaded;

  bool get isFavorited => _isFavorited;

  DateTime? get lastTimeReaded => _lastTimeReaded;

  set isFavorited(bool value) {
    _isFavorited = value;
  }

  set lastTimeReaded(DateTime? value) {
    _lastTimeReaded = value;
  }
}
