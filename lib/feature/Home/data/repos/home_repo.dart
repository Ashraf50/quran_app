import 'package:dartz/dartz.dart';
import 'package:quran_app/core/error/failure.dart';
import 'package:quran_app/core/utils/quran_model/surah.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<SurahModel>>> fetchAllSurah();
}
