import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/quran_model/array.dart';

part 'surah_bookmarks_state.dart';

class SurahBookmarksCubit extends Cubit<SurahBookmarksState> {
  SurahBookmarksCubit() : super(SurahBookmarksInitial());
  static SurahBookmarksCubit get(context) => BlocProvider.of(context);

  List selectedBooKMarks = [];

  add(Array ayah) {
    selectedBooKMarks.add(ayah);
    emit(UpdateSurahSelected());
  }

  bool isSelected(Array azkar) {
    final isSelected = selectedBooKMarks.contains(azkar);
    return isSelected;
  }

  delete(Array ayah) {
    selectedBooKMarks.remove(ayah);
    emit(UpdateSurahSelected());
  }
}
