import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_project/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_project/model/weather_model.dart';
import 'package:weather_project/service/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  late WeatherModel weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherSevice(dio: Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherDoneState());
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
