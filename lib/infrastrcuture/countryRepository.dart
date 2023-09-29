import 'dart:convert';
import 'package:cheq_test/models/country.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:country_calling_code_picker/picker.dart';

class CountryRepository {
  static Future<List<CountryClass>> getAll(BuildContext context) async {
    final response = await http.get(Uri.parse(
        'https://stage.terrafin.tech:8090/fkyc/whiteListedCountries'));
    if (response.statusCode == 200) {
      final res = json.decode(response.body);
      if (res['result'] == 'SUCCESS') {
        final List<dynamic> countries = res['data'];
        return countries
            .map((country) => CountryClass.fromJson(country))
            .toList();
      } else {
        throw Exception(res['error']);
      }
    } else {
      throw Exception('Error fetching countries');
    }
  }
}
