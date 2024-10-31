import 'package:flutter/material.dart';

import '../styles.dart';

class CityTile extends StatelessWidget {
  final String cityName;
  final Function(BuildContext context) onTap;

  const CityTile({
    super.key,
    required this.cityName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        cityName,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: const Icon(
        Icons.location_city,
        color: Styles.primaryColor,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        onTap(context);
      },
    );
  }
}
