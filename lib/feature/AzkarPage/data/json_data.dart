import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quran_app/core/utils/azkar_model/azkar_model.dart';

Future<List<AzkarModel>> getData() async {
  String jsonString =
      await rootBundle.loadString('assets/Adhkar_json/adhkar.json');
  var dataDecoded = jsonDecode(jsonString);
  List<AzkarModel> myData = [];
  for (var element in dataDecoded) {
    myData.add(AzkarModel.fromJson(element));
  }
  return myData;
}
