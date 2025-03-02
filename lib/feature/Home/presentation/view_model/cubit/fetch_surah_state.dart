part of 'fetch_surah_cubit.dart';

sealed class FetchSurahState {}

final class FetchSurahInitial extends FetchSurahState {}

final class FetchSurahLoading extends FetchSurahState {}

final class FetchSurahSuccess extends FetchSurahState {
  final List<QuranModel> surah;
  FetchSurahSuccess({
    required this.surah,
  });
}

final class FetchSurahFailure extends FetchSurahState {
  final String errMessage;
  FetchSurahFailure({
    required this.errMessage,
  });
}
