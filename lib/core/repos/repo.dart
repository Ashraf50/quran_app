import 'package:dartz/dartz.dart';
import 'package:quran_app/core/error/failure.dart';
import 'package:quran_app/core/utils/prayer_time_model/prayer_time_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<PrayerTimeModel>>> fetchALlPrayTime();
}
