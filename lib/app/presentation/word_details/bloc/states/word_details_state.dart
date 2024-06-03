import 'package:english_word_dictionary/app/domain/entities/word.dart';

abstract class WordDetailsState {}

class WordDetailsInitialState extends WordDetailsState {}

class GetWordDetailsLoadingState extends WordDetailsState {}

class GetWordDetailsSuccessState extends WordDetailsState {
  GetWordDetailsSuccessState(this.word);

  final Word word;
}

class GetWordDetailsErrorState extends WordDetailsState {
  GetWordDetailsErrorState(this.exception);

  final Exception exception;
}
