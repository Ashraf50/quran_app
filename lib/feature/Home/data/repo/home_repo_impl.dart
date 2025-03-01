import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran_app/core/error/failure.dart';
import 'package:quran_app/core/utils/api_services.dart';
import 'package:quran_app/feature/Home/data/model/surah_content_model/surah_content_model.dart';
import 'package:quran_app/feature/Home/data/model/surah_model/surah_model.dart';
import 'package:quran_app/feature/Home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  ApiServices apiServices = ApiServices();

  @override
  Future<Either<Failure, List<SurahModel>>> getAllSurah() async {
    try {
      var data = await apiServices.get(
        endPoint: "https://api.alquran.cloud/v1/surah",
      );
      List<SurahModel> allSurah = [];
      for (var surah in data["data"]) {
        allSurah.add(SurahModel.fromJson(surah));
      }
      return right(allSurah);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, SurahContentModel>> getSurahContent(
      {required int surahNumber}) async {
    try {
      var data = await apiServices.get(
        endPoint: "https://api.alquran.cloud/v1/surah/$surahNumber/ar.alafasy",
      );
      SurahContentModel surahContent = SurahContentModel.fromJson(data["data"]);
      return right(surahContent);
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
