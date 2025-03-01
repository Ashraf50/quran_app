import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/feature/Home/data/model/surah_model/surah_model.dart';

class SearchCubit extends Cubit<List<SurahModel>> {
  SearchCubit() : super([]);

  void searchSurah(String query) {
    List<SurahModel> filteredSurah = state
        .where((surah) =>
            (surah.name!.toLowerCase().contains(query)) ||
            (surah.englishName!.toLowerCase().contains(query)))
        .toList();
    emit(filteredSurah);
  }
}
