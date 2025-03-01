import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveLastRead({required String surah}) async {
  final pref = await SharedPreferences.getInstance();
  await pref.setString('lastSurah', surah);
}
