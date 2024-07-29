import 'package:flutter/material.dart';

import '../../../model/weather_class.dart';
import 'weather_icon_text.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({
    super.key,
    required this.weatherData,
  });

  final WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/weather/${weatherData.current!.weather![0].icon}.png',
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${weatherData.current!.temp!.toInt()}°",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .apply(fontWeightDelta: 2),
                ),
                Text(
                  weatherData.current!.weather![0].main.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WeatherIconText(
              imageName: 'assets/icons/windspeed.png',
              text: "${weatherData.current!.windSpeed}km/h",
            ),
            WeatherIconText(
              imageName: 'assets/icons/clouds.png',
              text: "${weatherData.current!.clouds}%",
            ),
            WeatherIconText(
              imageName: 'assets/icons/humidity.png',
              text: "${weatherData.current!.humidity}%",
            ),
          ],
        ),
      ],
    );
  }
}
