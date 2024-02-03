import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quran_app/core/utils/quran_model/quran_model.dart';

Future<List<QuranModel>> getAllQuran() async {
  String jsonString =
      await rootBundle.loadString('assets/Quran_json/Quran.json');
  var dataDecoded = jsonDecode(jsonString);
  List<QuranModel> myData = [];
  for (var element in dataDecoded) {
    myData.add(QuranModel.fromJson(element));
  }
  return myData;
}
