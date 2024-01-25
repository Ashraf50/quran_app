import 'data.dart';

class QuranModel {
  Data? data;

  QuranModel({
    required this.data,
  });

  @override
  String toString() {
    return 'QuranModel(data: $data)';
  }

  factory QuranModel.fromJson(Map<String, dynamic> json) {
  if (json['data'] != null && json['data'] is Map<String, dynamic>) {
    return QuranModel(
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  } else {
    // Handle the case when 'data' is null or not of the expected type
    return QuranModel(data: null);
  }
}

  Map<String, dynamic> toJson() => {
        'data': data!.toJson(),
      };
}
