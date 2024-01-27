import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/quran_model/surah.dart';
import 'package:quran_app/feature/Home/data/repos/home_repo.dart';

part 'get_all_quran_state.dart';

class GetAllQuranCubit extends Cubit<GetAllQuranState> {
  GetAllQuranCubit(this.homeRepo) : super(GetAllQuranInitial());
  final HomeRepo homeRepo;
  Future<void> fetchAllQuran() async {
    emit(GetAllQuranLoading());
    var result = await homeRepo.fetchAllSurah();
    result.fold(
      (failure) {
        emit(
          GetAllQuranFailure(errMessage: failure.errMessage),
        );
      },
      (quran) {
        emit(
          GetAllQuranSuccess(quran: quran),
        );
      },
    );
  }
}
