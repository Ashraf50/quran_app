import 'package:intl/intl.dart';

String convertTo12HourFormat(String time) {
  final DateFormat format24Hour = DateFormat('HH:mm');
  final DateFormat format12Hour = DateFormat('hh:mm');

  final DateTime dateTime = format24Hour.parse(time);
  final String convertedTime = format12Hour.format(dateTime);

  return convertedTime.toLowerCase();
}
