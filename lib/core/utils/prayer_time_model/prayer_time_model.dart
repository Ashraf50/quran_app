import 'datum.dart';

class PrayerTimeModel {
  int? code;
  String? status;
  List<Datum>? data;

  PrayerTimeModel({this.code, this.status, this.data});

  @override
  String toString() {
    return 'PrayerTimeModel(code: $code, status: $status, data: $data)';
  }

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) {
    return PrayerTimeModel(
      code: json['code'] as int?,
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
