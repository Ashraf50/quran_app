class AyahTafser {
  final String translation;
  AyahTafser({
    required this.translation,
  });
  factory AyahTafser.fromJson(Map<String, dynamic> json) => AyahTafser(
        translation: json['translation'],
      );
  Map<String, dynamic> toJson() => {
        'translation': translation,
      };
}
