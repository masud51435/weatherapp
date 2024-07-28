import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controllers/weather_controller.dart';

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
            : const SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Column(
                  children: [
                    HeaderLocationName(),
                  ],
                ),
              ),
      ),
    );
  }
}


