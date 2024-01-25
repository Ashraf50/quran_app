import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran_app/core/error/failure.dart';
import 'package:quran_app/core/utils/api_services.dart';
import 'package:quran_app/core/utils/quran_model/quran_model.dart';
import 'package:quran_app/feature/Home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  ApiServices apiServices;
  HomeRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, List<QuranModel>>> fetchAllSurah() async {
    try {
      var data = await apiServices.get(
          endPoint: "https://api.alquran.cloud/v1/quran/quran-uthmani");

      List<QuranModel> quran = [];
      for (var surah in data["data"]["surahs"]) {
        quran.add(QuranModel.fromJson(surah));
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
