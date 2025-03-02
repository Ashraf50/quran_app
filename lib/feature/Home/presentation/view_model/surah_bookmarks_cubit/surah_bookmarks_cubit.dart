import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/feature/Home/data/model/quran_model/ayahs.dart';
part 'surah_bookmarks_state.dart';

class SurahBookmarksCubit extends Cubit<SurahBookmarksState> {
  SurahBookmarksCubit() : super(SurahBookmarksInitial());
  static SurahBookmarksCubit get(context) => BlocProvider.of(context);

  List selectedBooKMarks = [];

  add(Ayahs ayah) {
    selectedBooKMarks.add(ayah);
    emit(UpdateSurahSelected());
  }

  bool isSelected(Ayahs ayah) {
    final isSelected = selectedBooKMarks.contains(ayah);
    return isSelected;
  }

  delete(Ayahs ayah) {
    selectedBooKMarks.remove(ayah);
    emit(UpdateSurahSelected());
  }
}
