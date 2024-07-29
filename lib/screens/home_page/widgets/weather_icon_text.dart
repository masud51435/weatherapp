import 'package:flutter/material.dart';

class WeatherIconText extends StatelessWidget {
  const WeatherIconText({
    super.key,
    required this.imageName,
    required this.text,
  });

  final String imageName;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.25),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset(
            imageName,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}