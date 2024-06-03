import 'package:english_word_dictionary/app/core/dependency_injection/dependency_injection.dart';
import 'package:english_word_dictionary/app/presentation/words/cubit/favorite_words_cubit.dart';
import 'package:english_word_dictionary/app/presentation/words/cubit/states/favorite_words_state.dart';
import 'package:english_word_dictionary/app/presentation/words/widgets/default_empty_list.dart';
import 'package:english_word_dictionary/app/presentation/words/widgets/tab_view_section.dart';
import 'package:english_word_dictionary/app/shared/dependencies/export.dart';
import 'package:flutter/material.dart';

class FavoriteWordsSection extends StatefulWidget {
  const FavoriteWordsSection({super.key});

  @override
  State<FavoriteWordsSection> createState() => _FavoriteWordsSectionState();
}

class _FavoriteWordsSectionState extends State<FavoriteWordsSection> {
  late final FavoriteWordsCubit _favoriteWordsCubit;

  @override
  void initState() {
    _favoriteWordsCubit =
        DependencyInjection.getDependency<FavoriteWordsCubit>();
    _favoriteWordsCubit.getFavoriteWords();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteWordsCubit, FavoriteWordsState>(
      bloc: _favoriteWordsCubit,
      builder: (context, state) {
        return Visibility(
          visible: state.words.isNotEmpty,
          replacement: const DefaultEmptyList(text: 'No favorite words'),
          child: TabViewSection(
            title: 'Favorites',
            words: state.words,
          ),
        );
      },
    );
  }
}
