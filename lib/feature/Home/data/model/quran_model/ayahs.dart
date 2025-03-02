class Ayahs {
  int? id;
  String? ar;
  String? en;
  String? filename;
  String? path;
  String? dir;
  int? size;

  Ayahs({
    this.id,
    this.ar,
    this.en,
    this.filename,
    this.path,
    this.dir,
    this.size,
  });

  factory Ayahs.fromJson(Map<String, dynamic> json) => Ayahs(
        id: json['id'] as int?,
        ar: json['ar'] as String?,
        en: json['en'] as String?,
        filename: json['filename'] as String?,
        path: json['path'] as String?,
        dir: json['dir'] as String?,
        size: json['size'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'ar': ar,
        'en': en,
        'filename': filename,
        'path': path,
        'dir': dir,
        'size': size,
      };
}
