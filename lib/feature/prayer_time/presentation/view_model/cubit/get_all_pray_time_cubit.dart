import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/feature/prayer_time/data/repos/repo.dart';
import 'package:quran_app/feature/prayer_time/data/model/prayer_time_model/pray_time_model.dart';
part 'get_all_pray_time_state.dart';

class GetAllPrayTimeCubit extends Cubit<GetAllPrayTimeState> {
  GetAllPrayTimeCubit(this.homeRepo) : super(GetAllPrayTimeInitial());
  final PrayRepo homeRepo;
  Future<void> fetchAdanTime() async {
    emit(GetAllPrayTimeLoading());
    var result = await homeRepo.fetchALlPrayTimeMonth();
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
