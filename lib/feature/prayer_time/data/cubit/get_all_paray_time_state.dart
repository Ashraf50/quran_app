part of 'get_all_paray_time_cubit.dart';

sealed class GetAllPrayTimeState {}

final class GetAllPrayTimeInitial extends GetAllPrayTimeState {}

final class GetAllPrayTimeLoading extends GetAllPrayTimeState {}

final class GetAllPrayTimeSuccess extends GetAllPrayTimeState {
  final List<PrayerTimeModel> time;
  GetAllPrayTimeSuccess({
    required this.time,
  });
}
final class GetAllPrayTimeFailure extends GetAllPrayTimeState {
  final String errMessage;
  GetAllPrayTimeFailure({
    required this.errMessage,
  });
}
