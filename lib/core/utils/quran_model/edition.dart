class Edition {
  String identifier;
  String language;
  String name;
  String englishName;
  String format;
  String type;

  Edition({
    required this.identifier,
    required this.language,
    required this.name,
    required this.englishName,
    required this.format,
    required this.type,
  });

  @override
  String toString() {
    return 'Edition(identifier: $identifier, language: $language, name: $name, englishName: $englishName, format: $format, type: $type)';
  }

  factory Edition.fromJson(Map<String, dynamic> json) => Edition(
        identifier: json['identifier'] ,
        language: json['language'] ,
        name: json['name'] ,
        englishName: json['englishName'] ,
        format: json['format'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => {
        'identifier': identifier,
        'language': language,
        'name': name,
        'englishName': englishName,
        'format': format,
        'type': type,
      };
}
