class MonthHijri {
  int? number;
  String? en;
  String? ar;

  MonthHijri({this.number, this.en, this.ar});

  @override
  String toString() => 'Month(number: $number, en: $en, ar: $ar)';

  factory MonthHijri.fromJson(Map<String, dynamic> json) => MonthHijri(
        number: json['number'] as int?,
        en: json['en'] as String?,
        ar: json["ar"] as String,
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'en': en,
        'ar': ar,
      };
}
