import 'package:quran_app/feature/radio/data/model/radio_model.dart';

abstract class RadioRepo {
  Future<RadioModel> getRadioData({required int surahNum});
}
