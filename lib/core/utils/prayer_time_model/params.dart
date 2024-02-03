class Params {
  double? fajr;
  double? isha;

  Params({this.fajr, this.isha});

  @override
  String toString() => 'Params(fajr: $fajr, isha: $isha)';

  factory Params.fromJson(Map<String, dynamic> json) => Params(
        fajr: (json['Fajr'] as num?)?.toDouble(),
        isha: (json['Isha'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'Fajr': fajr,
        'Isha': isha,
      };
}
