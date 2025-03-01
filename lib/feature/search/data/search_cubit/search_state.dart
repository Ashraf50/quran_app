import 'package:quran_app/feature/Home/data/model/surah_model/surah_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchSuccess extends SearchState {
  final List<SurahModel> quran;
  SearchSuccess(this.quran);
}

class SearchFailure extends SearchState {}
