import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/feature/AzkarPage/data/model/azkar_model/array.dart';
part 'azkar_book_marks_state.dart';

class AzkarBookMarksCubit extends Cubit<AzkarBookMarksState> {
  AzkarBookMarksCubit() : super(BookMarksInitial());
  static AzkarBookMarksCubit get(context) => BlocProvider.of(context);

  List selectedBooKMarks = [];

  add(Array azkar) {
    selectedBooKMarks.add(azkar);
    emit(UpdateAzkarSelected());
  }

  bool isSelected(Array azkar) {
    final isSelected = selectedBooKMarks.contains(azkar);
    return isSelected;
  }

  delete(Array azkar) {
    selectedBooKMarks.remove(azkar);
    emit(UpdateAzkarSelected());
  }
}
