import 'package:flutter/material.dart';

class WordCard extends StatelessWidget {
  const WordCard({super.key, required this.word, this.onTap});

  final String word;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      child: Material(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: onTap,
          child: Ink(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                word,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
