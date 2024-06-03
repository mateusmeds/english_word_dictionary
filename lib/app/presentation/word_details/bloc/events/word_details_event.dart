abstract class WordDetailsEvent {}

class GetWordDetailsEvent extends WordDetailsEvent {
  GetWordDetailsEvent({required this.word, this.id});

  final String word;
  final int? id;
}
