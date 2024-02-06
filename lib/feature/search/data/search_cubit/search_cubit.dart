import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/quran_model/quran_model.dart';

class SearchCubit extends Cubit<List<QuranModel>> {
  SearchCubit() : super([]);

  void searchSurah(String query) {
    // Use the 'where' method to filter the products based on the query
    List<QuranModel> filteredSurah = state
        .where((surah) =>
            (surah.name!.toLowerCase().contains(query)) ||
            (surah.nameEn!.toLowerCase().contains(query)))
        .toList();
    // Emit the filtered list to update the state
    emit(filteredSurah);
  }
}
