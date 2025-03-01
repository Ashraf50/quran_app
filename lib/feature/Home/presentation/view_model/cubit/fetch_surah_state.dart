part of 'fetch_surah_cubit.dart';

sealed class FetchSurahState {}

final class FetchSurahInitial extends FetchSurahState {}

final class FetchSurahLoading extends FetchSurahState {}

final class FetchSurahSuccess extends FetchSurahState {
  final List<SurahModel> surah;
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

final class FetchSurahContentLoading extends FetchSurahState {}

final class FetchSurahContentSuccess extends FetchSurahState {
  final SurahContentModel surah;
  FetchSurahContentSuccess({
    required this.surah,
  });
}

final class FetchSurahContentFailure extends FetchSurahState {
  final String errMessage;
  FetchSurahContentFailure({
    required this.errMessage,
  });
}
