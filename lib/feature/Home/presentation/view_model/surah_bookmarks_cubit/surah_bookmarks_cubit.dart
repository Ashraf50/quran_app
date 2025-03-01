import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/feature/Home/data/model/surah_content_model/ayah.dart';

part 'surah_bookmarks_state.dart';

class SurahBookmarksCubit extends Cubit<SurahBookmarksState> {
  SurahBookmarksCubit() : super(SurahBookmarksInitial());
  static SurahBookmarksCubit get(context) => BlocProvider.of(context);

  List selectedBooKMarks = [];

  add(Ayah ayah) {
    selectedBooKMarks.add(ayah);
    emit(UpdateSurahSelected());
  }

  bool isSelected(Ayah ayah) {
    final isSelected = selectedBooKMarks.contains(ayah);
    return isSelected;
  }

  delete(Ayah ayah) {
    selectedBooKMarks.remove(ayah);
    emit(UpdateSurahSelected());
  }
}
