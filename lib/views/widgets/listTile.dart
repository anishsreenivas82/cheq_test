import 'package:cheq_test/Constants/GlobalConstants.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(4),
        child: Text(
          name,
          style: GlobalConstants.subHeading,
        ));
  }
}
