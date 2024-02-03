class Weekday {
  String? en;

  Weekday({this.en});

  @override
  String toString() => 'Weekday(en: $en)';

  factory Weekday.fromJson(Map<String, dynamic> json) => Weekday(
        en: json['en'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'en': en,
      };
}
