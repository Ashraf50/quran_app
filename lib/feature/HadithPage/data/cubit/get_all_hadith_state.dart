part of 'get_all_hadith_cubit.dart';

sealed class GetAllHadithState {}

final class GetAllHadithInitial extends GetAllHadithState {}

final class GetAllHadithLoading extends GetAllHadithState {}

final class GetAllHadithSuccess extends GetAllHadithState {
  final List<HadithModel> hadiths;
  GetAllHadithSuccess({required this.hadiths});
}

final class GetAllHadithFailure extends GetAllHadithState {
  final String errMessage;
  GetAllHadithFailure({required this.errMessage});
}
