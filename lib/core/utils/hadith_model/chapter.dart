class Chapter {
  int? id;
  String? chapterNumber;
  String? chapterEnglish;
  String? chapterUrdu;
  String? chapterArabic;
  String? bookSlug;

  Chapter({
    this.id,
    this.chapterNumber,
    this.chapterEnglish,
    this.chapterUrdu,
    this.chapterArabic,
    this.bookSlug,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        id: json['id'] as int?,
        chapterNumber: json['chapterNumber'] as String?,
        chapterEnglish: json['chapterEnglish'] as String?,
        chapterUrdu: json['chapterUrdu'] as String?,
        chapterArabic: json['chapterArabic'] as String?,
        bookSlug: json['bookSlug'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'chapterNumber': chapterNumber,
        'chapterEnglish': chapterEnglish,
        'chapterUrdu': chapterUrdu,
        'chapterArabic': chapterArabic,
        'bookSlug': bookSlug,
      };
}
