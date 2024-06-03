import 'package:english_word_dictionary/app/core/export.dart';
import 'package:english_word_dictionary/app/domain/entities/word.dart';
import 'package:english_word_dictionary/app/presentation/word_details/bloc/events/word_details_event.dart';
import 'package:english_word_dictionary/app/presentation/word_details/bloc/states/word_details_state.dart';
import 'package:english_word_dictionary/app/presentation/word_details/bloc/word_details_bloc.dart';
import 'package:english_word_dictionary/app/presentation/word_details/widgets/audio_player_widget.dart';
import 'package:english_word_dictionary/app/presentation/word_details/widgets/previous_next_buttons.dart';
import 'package:english_word_dictionary/app/presentation/words/cubit/favorite_words_cubit.dart';
import 'package:english_word_dictionary/app/presentation/words/cubit/states/favorite_words_state.dart';
import 'package:english_word_dictionary/app/shared/dependencies/export.dart';
import 'package:flutter/material.dart';

class WordDetailsPage extends StatefulWidget {
  const WordDetailsPage({
    super.key,
    required this.word,
    required this.words,
    this.id,
  });

  final String word;
  final List<String> words;
  final int? id;

  @override
  State<WordDetailsPage> createState() => _WordDetailsPageState();
}

class _WordDetailsPageState extends State<WordDetailsPage> {
  late final WordDetailsBloc _wordDetailsBloc;
  late final FavoriteWordsCubit _favoriteWordsCubit;

  @override
  void initState() {
    _wordDetailsBloc = DependencyInjection.getDependency<WordDetailsBloc>();
    _favoriteWordsCubit =
        DependencyInjection.getDependency<FavoriteWordsCubit>();
    _wordDetailsBloc.add(GetWordDetailsEvent(word: widget.word, id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Details'),
      ),
      body: BlocBuilder<WordDetailsBloc, WordDetailsState>(
        bloc: _wordDetailsBloc,
        builder: (context, state) {
          if (state is WordDetailsInitialState ||
              state is GetWordDetailsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GetWordDetailsSuccessState) {
            final word = state.word;
            _favoriteWordsCubit.setInitialFavoriteState(word);
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        tileColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        contentPadding: const EdgeInsets.all(20),
                        titleAlignment: ListTileTitleAlignment.center,
                        title: Text(word.word, textAlign: TextAlign.center),
                        subtitle: Visibility(
                          visible: word.phonetic != null,
                          child: Container(
                            margin: const EdgeInsets.only(top: 30),
                            child: Text(
                              word.phonetic ?? '',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        trailing:
                            BlocBuilder<FavoriteWordsCubit, FavoriteWordsState>(
                          bloc: _favoriteWordsCubit,
                          buildWhen: (previous, current) =>
                              previous.isFavorited != current.isFavorited,
                          builder: (context, snapshot) {
                            return IconButton(
                              icon: Icon(snapshot.isFavorited
                                  ? Icons.star
                                  : Icons.star_border),
                              onPressed: () {
                                _favoriteWordsCubit.favoriteWord(word);
                              },
                            );
                          },
                        ),
                      ),
                      Visibility(
                        visible: getWordPhoneticAudioUrl(word) != null,
                        child: AudioPlayerWidget(
                          playerUrl: getWordPhoneticAudioUrl(word) ?? '',
                        ),
                      ),
                      const Text(
                        'Meanings',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: word.meanings.length,
                        itemBuilder: (context, index) {
                          final meaning = word.meanings[index];
                          return ListTile(
                            title: Text(meaning.partOfSpeech),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: meaning.definitions.length,
                                  itemBuilder: (context, index) {
                                    final definition =
                                        meaning.definitions[index];
                                    return ListTile(
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Definition'),
                                          Text(definition.definition),
                                        ],
                                      ),
                                      subtitle: Visibility(
                                        visible: definition.example != null,
                                        child: Text(
                                            'Example: ${definition.example ?? ''}'),
                                      ),
                                    );
                                  },
                                ),
                                Visibility(
                                  visible: meaning.synonyms.isNotEmpty,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Synonyms',
                                      ),
                                      Text(
                                        meaning.synonyms.join(', '),
                                      ),
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: meaning.antonyms.isNotEmpty,
                                  child: Column(
                                    children: [
                                      const Text(
                                        'Antonyms',
                                      ),
                                      Text(
                                        meaning.antonyms.join(', '),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                PreviousNextButtons(
                  index: _getWordCurrentIndex,
                  words: widget.words,
                ),
              ],
            );
          }
          return Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Error'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _wordDetailsBloc.add(
                          GetWordDetailsEvent(
                            word: widget.word,
                            id: widget.id,
                          ),
                        );
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
              PreviousNextButtons(
                index: _getWordCurrentIndex,
                words: widget.words,
              ),
            ],
          );
        },
      ),
    );
  }

  int get _getWordCurrentIndex => widget.words.indexOf(widget.word);

  String? getWordPhoneticAudioUrl(Word word) {
    try {
      var audioUrl = word.phonetics
          .firstWhere((element) => element.audio.isNotEmpty)
          .audio;
      return audioUrl;
    } catch (e) {
      return null;
    }
  }
}
