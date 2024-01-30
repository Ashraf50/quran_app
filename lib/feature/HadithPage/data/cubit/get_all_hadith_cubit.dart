import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/repos/repo.dart';
import 'package:quran_app/core/utils/hadith_model/hadith_model.dart';
part 'get_all_hadith_state.dart';

class GetAllHadithCubit extends Cubit<GetAllHadithState> {
  GetAllHadithCubit(this.homeRepo) : super(GetAllHadithInitial());
  final HomeRepo homeRepo;
  Future<void> fetchAllHadiths() async {
    emit(GetAllHadithLoading());
    var result = await homeRepo.fetchAllHadith();
    result.fold(
      (failure) {
        emit(
          GetAllHadithFailure(errMessage: failure.errMessage),
        );
      },
      (hadith) {
        emit(
          GetAllHadithSuccess(hadiths: hadith),
        );
      },
    );
  }
}
