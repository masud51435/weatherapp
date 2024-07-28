import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controllers/weather_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherController weatherController = Get.put(WeatherController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('weather app'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
