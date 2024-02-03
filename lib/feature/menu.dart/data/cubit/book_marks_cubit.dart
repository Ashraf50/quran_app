import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/quran_model/quran_model.dart';
part 'book_marks_state.dart';

class BookMarksCubit extends Cubit<BookMarksState> {
  BookMarksCubit() : super(BookMarksInitial());
  static BookMarksCubit get(context) => BlocProvider.of(context);

  List selectedBooKMarks = [];

  add(QuranModel ayah) {
    selectedBooKMarks.add(ayah);
    emit(UpdateFavSelectedAyahs());
  }

  bool isSelected(QuranModel ayah) {
    final isSelected = selectedBooKMarks.contains(ayah);
    return isSelected;
  }

  delete(QuranModel ayah) {
    selectedBooKMarks.remove(ayah);
    emit(UpdateFavSelectedAyahs());
  }
}
