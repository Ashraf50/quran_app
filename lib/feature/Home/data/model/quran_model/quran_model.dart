import 'ayahs.dart';

class QuranModel {
  int? id;
  String? name;
  String? nameEn;
  String? nameTranslation;
  int? words;
  int? letters;
  String? type;
  String? typeEn;
  String? ar;
  String? en;
  List<Ayahs>? array;

  QuranModel({
    this.id,
    this.name,
    this.nameEn,
    this.nameTranslation,
    this.words,
    this.letters,
    this.type,
    this.typeEn,
    this.ar,
    this.en,
    this.array,
  });

  factory QuranModel.fromJson(Map<String, dynamic> json) => QuranModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        nameEn: json['name_en'] as String?,
        nameTranslation: json['name_translation'] as String?,
        words: json['words'] as int?,
        letters: json['letters'] as int?,
        type: json['type'] as String?,
        typeEn: json['type_en'] as String?,
        ar: json['ar'] as String?,
        en: json['en'] as String?,
        array: (json['array'] as List<dynamic>?)
            ?.map((e) => Ayahs.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'name_en': nameEn,
        'name_translation': nameTranslation,
        'words': words,
        'letters': letters,
        'type': type,
        'type_en': typeEn,
        'ar': ar,
        'en': en,
        'array': array?.map((e) => e.toJson()).toList(),
      };
}
