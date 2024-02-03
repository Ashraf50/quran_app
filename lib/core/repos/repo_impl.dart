import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran_app/core/error/failure.dart';
import 'package:quran_app/core/utils/api_services.dart';
import 'package:quran_app/core/repos/repo.dart';
import 'package:quran_app/core/utils/prayer_time_model/prayer_time_model.dart';

class HomeRepoImpl implements HomeRepo {
  ApiServices apiServices;
  HomeRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, List<PrayerTimeModel>>> fetchALlPrayTime() async {
    try {
      var data = await apiServices.get(
        endPoint:
            "https://api.aladhan.com/v1/calendarByCity/2024/2?city=cairo&country=Egypt",
      );
      List<PrayerTimeModel> prayTime = [];
      for (var pray in data["data"]) {
        prayTime.add(PrayerTimeModel.fromJson(pray));
      }
      return right(prayTime);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }
}
