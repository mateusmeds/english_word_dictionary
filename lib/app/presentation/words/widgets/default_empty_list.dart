import 'package:flutter/material.dart';

class DefaultEmptyList extends StatelessWidget {
  const DefaultEmptyList({super.key, this.text = 'Empty list'});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        leading: const Icon(Icons.sentiment_dissatisfied),
        title: Text(text),
      ),
    );
  }
}
