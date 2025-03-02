import 'package:quran_app/core/utils/api_services.dart';
import 'package:quran_app/feature/radio/data/model/radio_model.dart';
import 'package:quran_app/feature/radio/data/repo/radio_repo.dart';

class RadioRepoImpl implements RadioRepo {
  final ApiServices apiServices = ApiServices();
  @override
  Future<RadioModel> getRadioData({required int surahNum}) async {
    var response = await apiServices.get(
        endPoint:
            'https://api3.islamhouse.com/v3/paV29H2gm56kvLPy/quran/get-sura/${surahNum + 1}/ar/json');
    return RadioModel.fromJson(response);
  }
}
