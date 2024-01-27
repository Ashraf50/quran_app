import 'package:quran_app/core/utils/quran_model/ayah.dart';

class SurahModel {
  int number;
  String name;
  String englishName;
  String englishNameTranslation;
  String revelationType;
  List<dynamic> ayahs;

  SurahModel({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.ayahs,
  });

  @override
  String toString() {
    return 'Surah(number: $number, name: $name, englishName: $englishName, englishNameTranslation: $englishNameTranslation, revelationType: $revelationType, ayahs: $ayahs,)';
  }

  factory SurahModel.fromJson(Map<String, dynamic> json) => SurahModel(
        number: json['number'],
        name: json['name'],
        englishName: json['englishName'],
        englishNameTranslation: json['englishNameTranslation'],
        revelationType: json['revelationType'],
        ayahs: (json['ayahs'])
            ?.map((e) => Ayah.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'name': name,
        'englishName': englishName,
        'englishNameTranslation': englishNameTranslation,
        'revelationType': revelationType,
        'ayahs': ayahs.map((e) => e.toJson()).toList(),
      };
}
