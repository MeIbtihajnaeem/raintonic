import 'package:flutter/material.dart';

class SearchCityWidget extends StatelessWidget {
  final Function callback;
  const SearchCityWidget({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width - 100,
            child: TextField(
              onChanged: (text) {
                callback(text);
              },
              onSubmitted: (text) {
                callback(text);
              },
              decoration: const InputDecoration(
                labelText: 'Enter City Name',
                hintText: 'e.g., New York',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_city),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
