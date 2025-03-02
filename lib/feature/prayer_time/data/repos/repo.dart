import 'package:dartz/dartz.dart';
import 'package:quran_app/core/error/failure.dart';
import 'package:quran_app/feature/prayer_time/data/model/prayer_time_model/pray_time_model.dart';

abstract class PrayRepo {
  Future<Either<Failure, List<PrayerTimeModel>>> fetchALlPrayTimeMonth();
}
