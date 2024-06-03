import 'package:english_word_dictionary/app/presentation/words/widgets/favorite_words_section.dart';
import 'package:english_word_dictionary/app/presentation/words/widgets/word_history_section.dart';
import 'package:english_word_dictionary/app/presentation/words/widgets/words_section.dart';
import 'package:flutter/material.dart';

class WordsPage extends StatelessWidget {
  const WordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Word list'),
              Tab(text: 'History'),
              Tab(text: 'Favorites'),
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
          ),
          child: const TabBarView(
            children: [
              WordsSection(),
              WordHistorySection(),
              FavoriteWordsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
