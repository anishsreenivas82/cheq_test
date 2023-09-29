import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
   CustomSearchBar({super.key,required this.valueNotifier});
  final ValueNotifier<String> valueNotifier;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
                child: Row(
              children: [
                Icon(Icons.search),
                Expanded(
                  child: TextFormField(
                    controller: _titleController,
                    onChanged: (value) {
                      widget.valueNotifier.value = value;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Search By Country Name',
                    ),
                  ),
                ),
              ],
            ));
  }
}