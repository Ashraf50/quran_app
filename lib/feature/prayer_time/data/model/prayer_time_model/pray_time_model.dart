import 'date.dart';
import 'meta.dart';
import 'timings.dart';

class PrayerTimeModel {
  Timings? timings;
  Date? date;
  Meta? meta;

  PrayerTimeModel({this.timings, this.date, this.meta});

  @override
  String toString() => 'Datum(timings: $timings, date: $date, meta: $meta)';

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) =>
      PrayerTimeModel(
        timings: json['timings'] == null
            ? null
            : Timings.fromJson(json['timings'] as Map<String, dynamic>),
        date: json['date'] == null
            ? null
            : Date.fromJson(json['date'] as Map<String, dynamic>),
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'timings': timings?.toJson(),
        'date': date?.toJson(),
        'meta': meta?.toJson(),
      };
}
