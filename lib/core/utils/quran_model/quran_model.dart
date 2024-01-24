import 'data.dart';

class QuranModel {
  int? code;
  String? status;
  Data? data;

  QuranModel({this.code, this.status, this.data});

  @override
  String toString() {
    return 'QuranModel(code: $code, status: $status, data: $data)';
  }

  factory QuranModel.fromJson(Map<String, dynamic> json) => QuranModel(
        code: json['code'] as int?,
        status: json['status'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'status': status,
        'data': data?.toJson(),
      };
}
