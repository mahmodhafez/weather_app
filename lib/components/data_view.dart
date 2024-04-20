import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_project/components/widgets/custom_text.dart';
import 'package:weather_project/cubits/get_weather_cubit/get_weather_cubit.dart';

class DataViewWidget extends StatelessWidget {
  const DataViewWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(
          flex: 3,
        ),
        Column(
          children: [
            Text(
              BlocProvider.of<GetWeatherCubit>(context).weatherModel.cityName,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            CustomTextWidget(
                BlocProvider.of<GetWeatherCubit>(context).weatherModel.date),
          ],
        ),
        const Spacer(
          flex: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 48,
              width: 48,
              child: Image.network(
                  fit: BoxFit.fill,
                  'https://cdn.icon-icons.com/icons2/1128/PNG/512/1486164734-123_79714.png'),
            ),
            CustomTextWidget(
                'Average\n temperature \t : \t ${BlocProvider.of<GetWeatherCubit>(context).weatherModel.avgTemp.toString()}'),
            Column(
              children: [
                CustomTextWidget(
                    'Max\n temperature \t : \t ${BlocProvider.of<GetWeatherCubit>(context).weatherModel.maxTemp}'),
                CustomTextWidget(
                    'Min\n temperature \t : \t ${BlocProvider.of<GetWeatherCubit>(context).weatherModel.minTemp}'),
              ],
            ),
          ],
        ),
        const Spacer(
          flex: 1,
        ),
        CustomTextWidget(BlocProvider.of<GetWeatherCubit>(context)
            .weatherModel
            .weatherState),
        const Spacer(
          flex: 3,
        )
      ],
    );
  }
}
