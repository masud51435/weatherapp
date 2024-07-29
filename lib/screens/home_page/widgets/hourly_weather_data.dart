import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/weather_controller.dart';
import '../../../model/weather_class.dart';

class HourlyWeatherData extends StatelessWidget {
  const HourlyWeatherData({
    super.key,
    required this.weatherData,
  });
  final WeatherData weatherData;

  String getTime(var timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String currentTime = DateFormat('jm').format(time);
    return currentTime;
  }

  @override
  Widget build(BuildContext context) {
    final WeatherController controller = WeatherController.instance;
    return Column(
      children: [
        const Center(
          child: Text(
            'Today',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: weatherData.hourly!.length > 12
                ? 12
                : weatherData.hourly!.length,
            itemBuilder: (BuildContext context, int index) {
              return Obx(
                () => GestureDetector(
                  onTap: () => controller.onItemTap(index),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: controller.isSelect(index)
                          ? Colors.blue.shade800
                          : Colors.grey.shade200,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getTime(
                            weatherData.hourly![index].dt,
                          ),
                          style: TextStyle(
                            color: controller.isSelect(index)
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        Image.asset(
                          height: 60,
                          'assets/weather/${weatherData.hourly![index].weather![0].icon}.png',
                        ),
                        Text(
                          "${weatherData.hourly![index].temp!.toInt()}°",
                          style: TextStyle(
                            fontSize: 16,
                            color: controller.isSelect(index)
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
