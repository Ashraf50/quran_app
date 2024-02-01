part of 'get_all_ayah_tafser_cubit.dart';

sealed class GetAllAyahTafserState {}

final class GetAllAyahTafserInitial extends GetAllAyahTafserState {}

final class GetAllAyahTafserLoading extends GetAllAyahTafserState {}

final class GetAllAyahTafserSuccess extends GetAllAyahTafserState {
  final List<AyahTafser> ayahTafser;
  GetAllAyahTafserSuccess({required this.ayahTafser});
}

final class GetAllAyahTafserFailure extends GetAllAyahTafserState {
  final String errMessage;
  GetAllAyahTafserFailure({required this.errMessage});
}
