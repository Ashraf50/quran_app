part of 'get_all_ayahs_cubit.dart';

sealed class GetAllAyahsState {}

final class GetAllAyahsInitial extends GetAllAyahsState {}

final class GetAllAyahsLoading extends GetAllAyahsState {}

final class GetAllAyahsSuccess extends GetAllAyahsState {
  final List<Ayah> ayahs;
  GetAllAyahsSuccess({required this.ayahs});
}

final class GetAllAyahsFailure extends GetAllAyahsState {
  final String errMessage;
  GetAllAyahsFailure({required this.errMessage});
}
