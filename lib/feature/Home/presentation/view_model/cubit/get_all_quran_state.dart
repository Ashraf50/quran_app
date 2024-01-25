part of 'get_all_quran_cubit.dart';

sealed class GetAllQuranState {}

final class GetAllQuranInitial extends GetAllQuranState {}

final class GetAllQuranLoading extends GetAllQuranState {}

final class GetAllQuranSuccess extends GetAllQuranState {
  final List<QuranModel> quran;
  GetAllQuranSuccess({required this.quran});
}

final class GetAllQuranFailure extends GetAllQuranState {
  final String errMessage;
  GetAllQuranFailure({required this.errMessage});
}
