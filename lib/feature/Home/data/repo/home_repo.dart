import 'package:dartz/dartz.dart';
import 'package:quran_app/core/error/failure.dart';
import 'package:quran_app/feature/Home/data/model/surah_content_model/surah_content_model.dart';
import 'package:quran_app/feature/Home/data/model/surah_model/surah_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<SurahModel>>> getAllSurah();
  Future<Either<Failure, SurahContentModel>> getSurahContent(
      {required int surahNumber});
}
