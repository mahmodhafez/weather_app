import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_project/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_project/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_project/views/search_view.dart';
import 'package:weather_project/components/data_view.dart';
import 'package:weather_project/components/no_data_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            
            return const NoDataViewWidget();
            
          } else if (state is WeatherDoneState) {
            
            return const DataViewWidget();
          } else {
            return const Center(
              child: Text(
                'There Was an error 😒 , Try again',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            );
          }
        },
      ),
    );
  }
}
