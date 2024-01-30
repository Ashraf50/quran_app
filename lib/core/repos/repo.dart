import 'package:dartz/dartz.dart';
import 'package:quran_app/core/error/failure.dart';
import 'package:quran_app/core/utils/hadith_model/hadith_model.dart';
import 'package:quran_app/core/utils/quran_model/ayah.dart';
import 'package:quran_app/core/utils/quran_model/surah_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<SurahModel>>> fetchAllSurah();
  Future<Either<Failure, List<Ayah>>> fetchAllAyahs({required int surahNumber});
  Future<Either<Failure, List<HadithModel>>> fetchAllHadith();
}
