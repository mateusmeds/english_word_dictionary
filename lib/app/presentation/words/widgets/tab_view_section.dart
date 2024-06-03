import 'package:english_word_dictionary/app/presentation/word_details/pages/word_details_page.dart';
import 'package:english_word_dictionary/app/presentation/words/widgets/word_card.dart';
import 'package:flutter/material.dart';

class TabViewSection extends StatelessWidget {
  const TabViewSection({
    super.key,
    required this.title,
    required this.words,
  });

  final String title;
  final List<String> words;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: RawScrollbar(
            controller: scrollController,
            thumbVisibility: true,
            thumbColor: Colors.deepPurpleAccent,
            child: GridView.builder(
              controller: scrollController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 7,
                mainAxisSpacing: 7,
              ),
              itemCount: words.length,
              itemBuilder: (context, index) {
                final word = words[index];
                return WordCard(
                  word: word,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WordDetailsPage(
                          word: word,
                          words: words,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
