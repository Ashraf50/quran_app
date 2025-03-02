part of 'get_radio_cubit.dart';

sealed class GetRadioState {}

final class GetRadioInitial extends GetRadioState {}

final class GetRadioLoading extends GetRadioState {}

final class GetRadioSuccess extends GetRadioState {
  final RadioModel radio;
  GetRadioSuccess({required this.radio});
}

final class GetRadioFailure extends GetRadioState {
  final String errMessage;
  GetRadioFailure({required this.errMessage});
}
