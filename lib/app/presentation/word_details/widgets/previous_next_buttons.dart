import 'package:english_word_dictionary/app/presentation/word_details/pages/word_details_page.dart';
import 'package:flutter/material.dart';

class PreviousNextButtons extends StatelessWidget {
  const PreviousNextButtons({
    super.key,
    required this.index,
    required this.words,
  });

  final int index;
  final List<String> words;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextButton(
            onPressed: _previousWordIndex != -1
                ? () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WordDetailsPage(
                            word: words[_previousWordIndex],
                            words: words,
                          );
                        },
                      ),
                    );
                  }
                : null,
            child: const Text('Previous'),
          ),
        ),
        const SizedBox(width: 30),
        Expanded(
          child: TextButton(
            onPressed: _nextWordIndex != -1
                ? () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WordDetailsPage(
                            word: words[_nextWordIndex],
                            words: words,
                          );
                        },
                      ),
                    );
                  }
                : null,
            child: const Text('Next'),
          ),
        ),
      ],
    );
  }

  int get _nextWordIndex {
    return _getIndex(index + 1);
  }

  int get _previousWordIndex {
    return _getIndex(index - 1);
  }

  int _getIndex(int index) {
    if (index < 0 || index >= words.length) {
      return -1;
    }
    return index;
  }
}
