import 'package:english_word_dictionary/app/domain/repositories/word_repository.dart';
import 'package:english_word_dictionary/app/presentation/word_details/bloc/events/word_details_event.dart';
import 'package:english_word_dictionary/app/presentation/word_details/bloc/states/word_details_state.dart';
import 'package:english_word_dictionary/app/shared/dependencies/export.dart'
    show Bloc, Emitter;

class WordDetailsBloc extends Bloc<WordDetailsEvent, WordDetailsState> {
  WordDetailsBloc(this._wordRepository) : super(WordDetailsInitialState()) {
    on<GetWordDetailsEvent>(_getWordDetails);
  }

  final WordRepository _wordRepository;

  void _getWordDetails(
      GetWordDetailsEvent event, Emitter<WordDetailsState> emit) async {
    emit(GetWordDetailsLoadingState());
    final response = await _wordRepository.getWord(event.word, id: event.id);
    response.fold(
      (word) async {
        emit(GetWordDetailsSuccessState(word));
        word.lastTimeReaded = DateTime.now();
        await _wordRepository.update(word);
      },
      (exception) => emit(GetWordDetailsErrorState(exception)),
    );
  }
}
