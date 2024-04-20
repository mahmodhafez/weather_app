import 'package:dio/dio.dart';
import 'package:weather_project/model/weather_model.dart';

class WeatherSevice {
  final Dio dio;

  WeatherSevice({required this.dio});
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '65f48383217f4f2aae881600240804';
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=10&aqi=no&alerts=no');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final errMassage =
          e.response?.data["error"]["message"] ?? 'there was an error';
      throw Exception(errMassage);
    } catch (e) {
      throw Exception('Try Later');
    }
  }
}





// class WeatherService {
//   Dio dio = Dio();
//   getCurrentWeather() async {
//     String date;
//     double maxTemp;
//     double minTemp;
//     double avgTemp;
//     String weatherState;
//     Response response = await dio.get(
//         'http://api.weatherapi.com/v1/forecast.json?key=65f48383217f4f2aae881600240804&q=Cairo&days=10&aqi=no&alerts=no');
//     Map<String, dynamic> jsonData = response.data;
//     Map<String, dynamic> forecast = jsonData["forecast"];
//     List<dynamic> forecastday = forecast["forecastday"];
//     Map<String, dynamic> infoOfDay = forecastday[1];
//     Map<String, dynamic> day = infoOfDay['day'];
//     maxTemp = day["maxtemp_c"];
//     minTemp = day["mintemp_c"];
//     avgTemp = day["avgtemp_c"];
//     date = infoOfDay['date'];
//     Map<String, dynamic> condition = day["condition"];
//     weatherState = condition["text"];
//   }
// }
