class WeatherModel {
  final String cityName;
  final String date;
  final double maxTemp;
  final double minTemp;
  final double avgTemp;
  final String weatherState;
  final String? image;

  WeatherModel({
    required this.image,
    required this.cityName,
    required this.weatherState,
    required this.date,
    required this.avgTemp,
    required this.maxTemp,
    required this.minTemp,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
        cityName: json["location"]["name"],
        weatherState: json["current"]["condition"]["text"],
        date: json["current"]["last_updated"],
        avgTemp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"]);
  }
}
