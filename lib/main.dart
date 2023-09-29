import 'package:cheq_test/Constants/GlobalConstants.dart';
import 'package:cheq_test/infrastrcuture/countryRepository.dart';
import 'package:cheq_test/models/country.dart';
import 'package:cheq_test/views/pages/Home.dart';
import 'package:cheq_test/views/widgets/listTile.dart';
import 'package:cheq_test/views/widgets/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:country_calling_code_picker/picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

