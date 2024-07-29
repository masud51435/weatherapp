import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../model/weather_class.dart';

class ComfortLevel extends StatelessWidget {
  const ComfortLevel({
    super.key,
    required this.weatherData,
  });

  final WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            'Comfort Level',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 15),
        SleekCircularSlider(
          min: 0,
          max: 100,
          initialValue: weatherData.current!.humidity!.toDouble(),
          appearance: CircularSliderAppearance(
            animationEnabled: true,
            size: 200,
            infoProperties: InfoProperties(
              mainLabelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 40,
              ),
              bottomLabelText: 'Humidity',
              bottomLabelStyle: TextStyle(
                color: Colors.grey.shade800,
              ),
            ),
            customColors: CustomSliderColors(
              progressBarColor: Colors.blue,
              trackColor: Colors.grey,
              hideShadow: true,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Feels Like ${weatherData.current!.feelsLike}°",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "UV Index ${weatherData.current!.uvi}",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )
      ],
    );
  }
}
