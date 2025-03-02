import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/feature/radio/data/model/radio_model.dart';
import 'package:quran_app/feature/radio/data/repo/radio_repo.dart';
part 'get_radio_state.dart';

class GetRadioCubit extends Cubit<GetRadioState> {
  RadioRepo radioRepo;
  GetRadioCubit(this.radioRepo) : super(GetRadioInitial());
  Future<void> fetchRadio(int surahNum) async {
    emit(GetRadioLoading());
    try {
      final radio = await radioRepo.getRadioData(surahNum: surahNum);
      emit(GetRadioSuccess(radio: radio));
    } catch (e) {
      emit(GetRadioFailure(errMessage: e.toString()));
    }
  }
}
