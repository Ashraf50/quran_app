import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/feature/Home/data/model/surah_content_model/surah_content_model.dart';
import 'package:quran_app/feature/Home/data/model/surah_model/surah_model.dart';
import 'package:quran_app/feature/Home/data/repo/home_repo.dart';
part 'fetch_surah_state.dart';

class FetchSurahCubit extends Cubit<FetchSurahState> {
  FetchSurahCubit(this.homeRepo) : super(FetchSurahInitial());
  HomeRepo homeRepo;
  Future<void> fetchSurah() async {
    emit(FetchSurahLoading());
    var result = await homeRepo.getAllSurah();
    result.fold((failure) {
      emit(FetchSurahFailure(errMessage: failure.errMessage));
    }, (surah) {
      emit(FetchSurahSuccess(surah: surah));
    });
  }

  Future<void> fetchSurahContent({required int surahNumber}) async {
    emit(FetchSurahContentLoading());
    var result = await homeRepo.getSurahContent(surahNumber: surahNumber);
    result.fold((failure) {
      emit(FetchSurahContentFailure(errMessage: failure.errMessage));
    }, (surah) {
      emit(FetchSurahContentSuccess(surah: surah));
    });
  }
}
