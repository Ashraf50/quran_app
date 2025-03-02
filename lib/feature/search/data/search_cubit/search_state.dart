import '../../../Home/data/model/quran_model/quran_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchSuccess extends SearchState {
  final List<QuranModel> quran;
  SearchSuccess(this.quran);
}

class SearchFailure extends SearchState {}
