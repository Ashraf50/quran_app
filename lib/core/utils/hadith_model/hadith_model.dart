import 'package:quran_app/core/utils/hadith_model/book.dart';
import 'package:quran_app/core/utils/hadith_model/chapter.dart';

class HadithModel {
  int id;
  String hadithNumber;
  String englishNarrator;
  String hadithEnglish;
  String hadithUrdu;
  String urduNarrator;
  String hadithArabic;
  String chapterId;
  String bookSlug;
  String volume;
  String status;
  Book book;
  Chapter chapter;
  HadithModel({
    required this.id,
    required this.hadithNumber,
    required this.englishNarrator,
    required this.hadithEnglish,
    required this.hadithUrdu,
    required this.urduNarrator,
    required this.hadithArabic,
    required this.chapterId,
    required this.bookSlug,
    required this.volume,
    required this.status,
    required this.book,
    required this.chapter,
  });
  factory HadithModel.fromJson(Map<String, dynamic> json) => HadithModel(
        id: json['id'],
        hadithNumber: json['hadithNumber'],
        englishNarrator: json['englishNarrator'],
        hadithEnglish: json['hadithEnglish'],
        hadithUrdu: json['hadithUrdu'],
        urduNarrator: json['urduNarrator'],
        hadithArabic: json['hadithArabic'],
        chapterId: json['chapterId'],
        bookSlug: json['bookSlug'],
        volume: json['volume'],
        status: json['status'],
        book: Book.fromJson(json['book'] as Map<String, dynamic>),
        chapter: Chapter.fromJson(json['chapter'] as Map<String, dynamic>),
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'hadithNumber': hadithNumber,
        'englishNarrator': englishNarrator,
        'hadithEnglish': hadithEnglish,
        'hadithUrdu': hadithUrdu,
        'urduNarrator': urduNarrator,
        'hadithArabic': hadithArabic,
        'chapterId': chapterId,
        'bookSlug': bookSlug,
        'volume': volume,
        'status': status,
        'book': book.toJson(),
        'chapter': chapter.toJson(),
      };
}
