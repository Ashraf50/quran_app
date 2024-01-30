class Ayah {
  int number;
  String text;
  String audio;
  int numberInSurah;
  Ayah({
    required this.number,
    required this.text,
    required this.audio,
    required this.numberInSurah,
  });
  @override
  String toString() {
    return 'Ayah(number: $number, text: $text, numberInSurah: $numberInSurah, audio: $audio,)';
  }

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
        number: json['number'],
        text: json['text'],
        numberInSurah: json['numberInSurah'],
        audio: json['audio'],
      );
  Map<String, dynamic> toJson() => {
        'number': number,
        'text': text,
        'numberInSurah': numberInSurah,
        'audio': audio,
      };
}
