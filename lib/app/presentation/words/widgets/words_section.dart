import 'package:english_word_dictionary/app/core/global_variable/global_variable.dart';
import 'package:english_word_dictionary/app/presentation/words/widgets/tab_view_section.dart';
import 'package:flutter/material.dart';

class WordsSection extends StatelessWidget {
  const WordsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return TabViewSection(
      title: 'Word list',
      words: GlobalVariable.words,
    );
  }
}
