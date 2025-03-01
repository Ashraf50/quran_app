class Weekday {
  String? en;
  String? ar;

  Weekday({
    this.en,
    this.ar,
  });

  @override
  String toString() => 'Weekday(en: $en) , Weekday(ar: $ar)';

  factory Weekday.fromJson(Map<String, dynamic> json) =>
      Weekday(en: json['en'] as String?, ar: json['ar'] as String?);

  Map<String, dynamic> toJson() => {
        'en': en,
        'ar': ar,
      };
}
