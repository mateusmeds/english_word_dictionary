class DefinitionDTO {
  DefinitionDTO({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
    this.example,
  });

  final String definition;
  final List<String> synonyms;
  final List<String> antonyms;
  final String? example;

  factory DefinitionDTO.fromJson(dynamic json) {
    return DefinitionDTO(
      definition: json['definition'],
      synonyms: List<String>.from(json['synonyms'].map((x) => x)),
      antonyms: List<String>.from(json['antonyms'].map((x) => x)),
      example: json['example'],
    );
  }
}
