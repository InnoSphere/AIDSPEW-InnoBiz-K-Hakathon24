import 'dart:convert';

import 'package:malaria_prediction/service/jsonservice.dart';

class CountryData {
  final String name;
  final List<Map<String, dynamic>> data;

  CountryData({required this.name, required this.data});

  factory CountryData.fromJson(Map<String, dynamic> json) {
    return CountryData(
      name: json['name'],
      data: List<Map<String, dynamic>>.from(json['data']),
    );
  }
}

Future<List<CountryData>> parseCountryData() async {
  String jsonString = await loadAsset();
  final parsed = jsonDecode(jsonString)['countries'].cast<Map<String, dynamic>>();
  return parsed.map<CountryData>((json) => CountryData.fromJson(json)).toList();
}
