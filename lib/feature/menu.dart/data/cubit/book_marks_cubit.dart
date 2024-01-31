import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/quran_model/ayah.dart';

part 'book_marks_state.dart';

class BookMarksCubit extends Cubit<BookMarksState> {
  BookMarksCubit() : super(BookMarksInitial());
  static BookMarksCubit get(context) => BlocProvider.of(context);

  List selectedBooKMarks = [];

  add(Ayah ayah) {
    selectedBooKMarks.add(ayah);
    emit(UpdateFavSelectedAyahs());
  }

  bool isSelected(Ayah ayah) {
    final isSelected = selectedBooKMarks.contains(ayah);
    return isSelected;
  }

  delete(Ayah ayah) {
    selectedBooKMarks.remove(ayah);
    emit(UpdateFavSelectedAyahs());
  }
}
