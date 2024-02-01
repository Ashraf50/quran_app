import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quran_app/core/error/failure.dart';
import 'package:quran_app/core/utils/api_services.dart';
import 'package:quran_app/core/utils/ayah_tafser/result.dart';
import 'package:quran_app/core/utils/hadith_model/hadith_model.dart';
import 'package:quran_app/core/utils/quran_model/ayah.dart';
import 'package:quran_app/core/utils/quran_model/surah_model.dart';
import 'package:quran_app/core/repos/repo.dart';

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

  @override
  Future<Either<Failure, List<Ayah>>> fetchAllAyahs(
      {required int surahNumber}) async {
    try {
      var data = await apiServices.get(
          endPoint:
              "https://api.alquran.cloud/v1/surah/$surahNumber/ar.alafasy");
      List<Ayah> ayahs = [];
      for (var ayah in data["data"]["ayahs"]) {
        ayahs.add(Ayah.fromJson(ayah));
      }
      return right(ayahs);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  Future<Either<Failure, List<AyahTafser>>> fetchAllAyahsTafser(
      {required int surahNumber}) async {
    try {
      var data = await apiServices.get(
          endPoint:
              "https://quranenc.com/api/v1/translation/sura/arabic_moyassar/$surahNumber");
      List<AyahTafser> ayahsTafser = [];
      for (var ayah in data["result"]) {
        ayahsTafser.add(AyahTafser.fromJson(ayah));
      }
      return right(ayahsTafser);
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
