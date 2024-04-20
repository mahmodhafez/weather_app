import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_project/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            const Text(
              'Search Page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: TextField(
                onSubmitted: (value) async {
                  GetWeatherCubit getWeather =
                      BlocProvider.of<GetWeatherCubit>(context);
                  getWeather.getWeather(cityName: value);
                  Navigator.pop(context);
                },
                decoration: InputDecoration(
                  label: const Text('City name'),
                  hintText: 'Enter here city name ... ex: Cairo ',
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
