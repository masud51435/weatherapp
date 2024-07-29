import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weatherapp/api/fetch_api.dart';
import 'package:weatherapp/controllers/weather_controller.dart';
import 'package:weatherapp/model/weather_class.dart';

import 'widgets/header_location_date.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherController weatherController = Get.put(WeatherController());
    return Scaffold(
      body: Obx(
        () => weatherController.checkLoading().isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderLocationName(),
                    const SizedBox(height: 20),
                    CurrentWeatherWidget(
                      weatherData: weatherController.getWeatherData(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

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
              children: [
                Text(
                  weatherData.current!.temp!.toInt().toString(),
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .apply(fontWeightDelta: 2),
                ),
                const SizedBox(width: 15),
                Text(
                  weatherData.current!.weather![0].main.toString(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
