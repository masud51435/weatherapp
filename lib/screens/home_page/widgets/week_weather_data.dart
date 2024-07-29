import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../model/weather_class.dart';

class WeekWeatherData extends StatelessWidget {
  const WeekWeatherData({
    super.key,
    required this.weatherData,
  });
  final WeatherData weatherData;

  String getDay(var timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String currentTime = DateFormat.E().format(time);
    return currentTime;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Next Days',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          ListView.builder(
            itemCount: weatherData.daily!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getDay(weatherData.daily![index].dt),
                      ),
                      Image.asset(
                        height: 30,
                        'assets/weather/${weatherData.daily![index].weather![0].icon}.png',
                      ),
                      Text(
                        '${weatherData.daily![index].temp!.max!.toInt()}°/${weatherData.daily![index].temp!.min!.toInt()}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Divider(),
                  const SizedBox(height: 5),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
