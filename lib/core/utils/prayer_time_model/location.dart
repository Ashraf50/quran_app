class Location {
  double? latitude;
  double? longitude;

  Location({this.latitude, this.longitude});

  @override
  String toString() {
    return 'Location(latitude: $latitude, longitude: $longitude)';
  }

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
}
