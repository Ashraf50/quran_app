import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/repos/repo.dart';
import 'package:quran_app/core/utils/ayah_tafser/result.dart';

part 'get_all_ayah_tafser_state.dart';

class GetAllAyahTafserCubit extends Cubit<GetAllAyahTafserState> {
  GetAllAyahTafserCubit(this.homeRepo) : super(GetAllAyahTafserInitial());
  final HomeRepo homeRepo;
  Future<void> fetchAllAyahTafsere({required int surahNumber}) async {
    emit(GetAllAyahTafserLoading());
    var result = await homeRepo.fetchAllAyahsTafser(surahNumber: surahNumber);
    result.fold(
      (failure) {
        emit(
          GetAllAyahTafserFailure(errMessage: failure.errMessage),
        );
      },
      (ayahs) {
        emit(
          GetAllAyahTafserSuccess(ayahTafser: ayahs),
        );
      },
    );
  }
}
