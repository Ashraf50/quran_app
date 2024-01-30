import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/quran_model/ayah.dart';
import 'package:quran_app/core/repos/repo.dart';
part 'get_all_ayahs_state.dart';

class GetAllAyahsCubit extends Cubit<GetAllAyahsState> {
  GetAllAyahsCubit(this.homeRepo) : super(GetAllAyahsInitial());
  final HomeRepo homeRepo;
  Future<void> fetchAllAyah({required int surahNumber}) async {
    emit(GetAllAyahsLoading());
    var result = await homeRepo.fetchAllAyahs(surahNumber: surahNumber);
    result.fold(
      (failure) {
        emit(
          GetAllAyahsFailure(errMessage: failure.errMessage),
        );
      },
      (ayahs) {
        emit(
          GetAllAyahsSuccess(ayahs: ayahs),
        );
      },
    );
  }
}
