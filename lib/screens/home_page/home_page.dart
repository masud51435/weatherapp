import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controllers/weather_controller.dart';
import 'widgets/current_weather_widget.dart';
import 'widgets/header_location_date.dart';
import 'widgets/hourly_weather_data.dart';

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
                    const SizedBox(height: 25),
                    HourlyWeatherData(
                      weatherData: weatherController.getWeatherData(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}


