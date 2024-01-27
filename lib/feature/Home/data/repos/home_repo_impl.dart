import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran_app/core/error/failure.dart';
import 'package:quran_app/core/utils/api_services.dart';
import 'package:quran_app/core/utils/quran_model/surah.dart';
import 'package:quran_app/feature/Home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  ApiServices apiServices;
  HomeRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, List<SurahModel>>> fetchAllSurah() async {
    try {
      var data = await apiServices.get(
          endPoint: "https://api.alquran.cloud/v1/quran/quran-uthmani");

      List<SurahModel> quran = [];
      for (var surah in data["data"]["surahs"]) {
        quran.add(SurahModel.fromJson(surah));
      }
      return right(quran);
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
