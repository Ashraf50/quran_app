import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/feature/Home/data/model/quran_model/quran_model.dart';
part 'fetch_surah_state.dart';

class FetchSurahCubit extends Cubit<FetchSurahState> {
  FetchSurahCubit() : super(FetchSurahInitial());

  Future fetchSurah() async {
    emit(FetchSurahLoading());
    try {
      String jsonString =
          await rootBundle.loadString('assets/quran_json/Quran.json');
      var dataDecoded = jsonDecode(jsonString);
      List<QuranModel> myData = [];
      for (var element in dataDecoded) {
        myData.add(QuranModel.fromJson(element));
      }
      emit(FetchSurahSuccess(surah: myData));
    } catch (e) {
      emit(FetchSurahFailure(errMessage: e.toString()));
    }
  }
}