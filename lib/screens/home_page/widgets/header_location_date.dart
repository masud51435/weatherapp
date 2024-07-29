import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';

import '../../../controllers/weather_controller.dart';

class HeaderLocationName extends StatefulWidget {
  const HeaderLocationName({
    super.key,
  });

  @override
  State<HeaderLocationName> createState() => _HeaderLocationNameState();
}

class _HeaderLocationNameState extends State<HeaderLocationName> {
  final WeatherController controller = WeatherController.instance;
  String city = "";

  @override
  void initState() {
    // TODO: implement initState
    getAddress(
      controller.latitude().value,
      controller.longitude().value,
    );
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemarks[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          city,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(fontWeightDelta: 2),
        ),
        Text(
          DateFormat.yMMMMEEEEd().format(DateTime.now()),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}