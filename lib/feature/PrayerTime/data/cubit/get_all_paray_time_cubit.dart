import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/repos/repo.dart';
import 'package:quran_app/core/utils/prayer_time_model/prayer_time_model.dart';
part 'get_all_paray_time_state.dart';

class GetAllPrayTimeCubit extends Cubit<GetAllPrayTimeState> {
  GetAllPrayTimeCubit(this.homeRepo) : super(GetAllPrayTimeInitial());
  final HomeRepo homeRepo;
  Future<void> fetchAdanTime() async {
    emit(GetAllPrayTimeLoading());
    var result = await homeRepo.fetchALlPrayTime();
    result.fold(
      (failure) {
        emit(
          GetAllPrayTimeFailure(errMessage: failure.errMessage),
        );
      },
      (adan) {
        emit(
          GetAllPrayTimeSuccess(time: adan),
        );
      },
    );
  }
}
