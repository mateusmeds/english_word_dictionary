class PhoneticDTO {
  PhoneticDTO({required this.text, required this.audio});

  final String text;
  final String audio;

  factory PhoneticDTO.fromJson(dynamic json) {
    return PhoneticDTO(
      text: json['text'] ?? '',
      audio: json['audio'] ?? '',
    );
  }
}
