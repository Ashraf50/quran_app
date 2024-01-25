import 'edition.dart';
import 'surah.dart';

class Data {
  List<Surah> surahs;
  Edition edition;

  Data({
    required this.surahs,
    required this.edition,
  });

  @override
  String toString() => 'Data(surahs: $surahs, edition: $edition)';

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        surahs: (json['surahs'])
            ?.map((e) => Surah.fromJson(e as Map<String, dynamic>))
            .toList(),
        edition: Edition.fromJson(json['edition'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'surahs': surahs.map((e) => e.toJson()).toList(),
        'edition': edition.toJson(),
      };
}
