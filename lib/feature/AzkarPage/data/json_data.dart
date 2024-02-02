import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:quran_app/core/utils/adhkar_model/adhkar_model.dart';

Future<List<AdhkarModel>> getData() async {
  String jsonString = await rootBundle.loadString('assets/img/adhkar.json');
  var dataDecoded = jsonDecode(jsonString);
  List<AdhkarModel> myData = [];
  for (var element in dataDecoded) {
    myData.add(AdhkarModel.fromJson(element));
  }
  return myData;
}
