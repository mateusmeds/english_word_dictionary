import 'package:english_word_dictionary/app/core/export.dart';
import 'package:english_word_dictionary/app/presentation/words/cubit/states/word_history_state.dart';
import 'package:english_word_dictionary/app/presentation/words/cubit/word_history_cubit.dart';
import 'package:english_word_dictionary/app/presentation/words/widgets/tab_view_section.dart';
import 'package:english_word_dictionary/app/shared/dependencies/export.dart';
import 'package:flutter/material.dart';

class WordHistorySection extends StatefulWidget {
  const WordHistorySection({super.key});

  @override
  State<WordHistorySection> createState() => _WordHistorySectionState();
}

class _WordHistorySectionState extends State<WordHistorySection> {
  late final WordHistoryCubit _wordHistoryCubit;

  @override
  void initState() {
    _wordHistoryCubit = DependencyInjection.getDependency<WordHistoryCubit>();
    _wordHistoryCubit.getWordHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordHistoryCubit, WordHistoryState>(
      bloc: _wordHistoryCubit,
      builder: (context, state) {
        return TabViewSection(
          title: 'History',
          words: state.words,
        );
      },
    );
  }
}
