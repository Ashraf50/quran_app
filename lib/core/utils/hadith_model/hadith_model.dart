class HadithModel {
  int number;
  String arab;
  String id;
  HadithModel({
    required this.id,
    required this.number,
    required this.arab,
  });
  factory HadithModel.fromJson(Map<String, dynamic> json) => HadithModel(
        id: json['id'],
        number: json['number'],
        arab: json['arab'],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
        'arab': arab,
      };
}
