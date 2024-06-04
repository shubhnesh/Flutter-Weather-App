import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import 'city_search_box.dart';
import 'current_weather.dart';


class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key, required this.city});
  final String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.sunriseGradient,
          ),
        ),
        child: const SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              CitySearchBox(),
              Spacer(),
              CurrentWeather(),
              Spacer(),
              // HourlyWeather(),
              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
