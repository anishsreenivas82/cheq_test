import 'package:cheq_test/Constants/GlobalConstants.dart';
import 'package:cheq_test/infrastrcuture/countryRepository.dart';
import 'package:cheq_test/models/country.dart';
import 'package:cheq_test/views/widgets/listTile.dart';
import 'package:cheq_test/views/widgets/searchbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<String> _valueNotifier = ValueNotifier('');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Select your nationality',
              style: GlobalConstants.heading,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'UPI digital wallet can be issued only to citizens from one of the following countries',
              style: GlobalConstants.subHeading,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomSearchBar(valueNotifier: _valueNotifier),
            Expanded(
              child: FutureBuilder<List<CountryClass>>(
                  future: CountryRepository.getAll(context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        child: ValueListenableBuilder(
                            valueListenable: _valueNotifier,
                            builder: (context, value, child) {
                              return Column(
                                children: [
                                  for (int i = 0;
                                      i < snapshot.data!.length;
                                      i++)
                                    if (snapshot.data![i].name
                                            .toLowerCase()
                                            .contains(value.toLowerCase()) ||
                                        value == '')
                                      ListItem(name: snapshot.data![i].name)
                                ],
                              );
                            }),
                      );
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return Center(
                      child: Container(
                          height: 100,
                          width: 100,
                          child: const CircularProgressIndicator()),
                    );
                  }),
            )
          ]),
        ),
      ),
    );
    ;
  }
}
