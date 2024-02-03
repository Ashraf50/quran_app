import 'package:dartz/dartz.dart';
import 'package:quran_app/core/error/failure.dart';
import 'package:quran_app/core/utils/hadith_model/hadith_model.dart';
abstract class HomeRepo {
  Future<Either<Failure, List<HadithModel>>> fetchAllHadith();
}
