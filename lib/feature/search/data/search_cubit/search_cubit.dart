import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/feature/Home/data/model/quran_model/quran_model.dart';

class SearchCubit extends Cubit<List<QuranModel>> {
  SearchCubit() : super([]);

  void searchSurah(String query) {
    List<QuranModel> filteredSurah = state
        .where((surah) =>
            (surah.name!.toLowerCase().contains(query)) ||
            (surah.nameTranslation!.toLowerCase().contains(query)))
        .toList();
    emit(filteredSurah);
  }
}
