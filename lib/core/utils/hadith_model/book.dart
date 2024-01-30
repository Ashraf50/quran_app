class Book {
  int? id;
  String? bookName;
  String? writerName;
  dynamic aboutWriter;
  String? writerDeath;
  String? bookSlug;
  Book({
    this.id,
    this.bookName,
    this.writerName,
    this.aboutWriter,
    this.writerDeath,
    this.bookSlug,
  });
  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json['id'] as int?,
        bookName: json['bookName'] as String?,
        writerName: json['writerName'] as String?,
        aboutWriter: json['aboutWriter'] as dynamic,
        writerDeath: json['writerDeath'] as String?,
        bookSlug: json['bookSlug'] as String?,
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'bookName': bookName,
        'writerName': writerName,
        'aboutWriter': aboutWriter,
        'writerDeath': writerDeath,
        'bookSlug': bookSlug,
      };
}
