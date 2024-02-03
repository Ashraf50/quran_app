import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran_app/core/error/failure.dart';
import 'package:quran_app/core/utils/api_services.dart';
import 'package:quran_app/core/utils/hadith_model/hadith_model.dart';
import 'package:quran_app/core/repos/repo.dart';

class HomeRepoImpl implements HomeRepo {
  ApiServices apiServices;
  HomeRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, List<HadithModel>>> fetchAllHadith() async {
    try {
      var data = await apiServices.get(
          endPoint:
              "https://hadis-api-id.vercel.app/hadith/abu-dawud?page=1&limit=100");

      List<HadithModel> hadiths = [];
      for (var hadith in data["items"]) {
        hadiths.add(HadithModel.fromJson(hadith));
      }
      return right(hadiths);
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
