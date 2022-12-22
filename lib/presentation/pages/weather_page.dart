import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/presentation/bloc/weather_bloc.dart';
import 'package:flutter_weather_app/presentation/bloc/weather_event.dart';
import 'package:flutter_weather_app/presentation/bloc/weather_state.dart';
import '../../data/constants.dart';
import '../../domain/entities/weather.dart';
import 'package:coreui/coreui.dart';

class WeatherPage extends StatelessWidget {
  WeatherPage({super.key});
  final TextEditingController cityController = TextEditingController();

  _addCityChangedEvent(BuildContext context) {
    //context.read<WeatherBloc>().add(OnCityChanged());
    BlocProvider.of<WeatherBloc>(context)
        .add(OnCityChanged(cityController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: const Text(
      //     'Weather',
      //     style: TextStyle(color: Colors.orange),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomTextField(
                  text: 'Please enter you city below to check weather',
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 500,
                  child: TextField(
                    controller: cityController,
                    textAlign: TextAlign.start,
                    decoration: const InputDecoration(
                        hintText: 'Enter city name',
                        label: Text('City Name'),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal))),
                    onSubmitted: (query) {
                      _addCityChangedEvent(context);
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocBuilder<WeatherBloc, WeatherState>(
                    builder: (context, state) {
                  if (state is WeatherLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is WeatherData) {
                    //return Container();
                    return WeatherWidget(result: state.result);
                  } else if (state is WeatherError) {
                    return CustomErrorScreen(message: state.message);
                  } else if (state is WeatherNoInternet) {
                    return NoInternetScreen(
                        message: state.message, onPressed: () {});
                  } else {
                    return const SizedBox();
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WeatherWidget extends StatelessWidget {
  final Weather result;

  const WeatherWidget({super.key, required this.result});
  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key('weather_data'),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result.cityName ?? "dummy",
              style: const TextStyle(fontSize: 22),
            ),
            Image(
                image: NetworkImage(
              Urls.weatherIcon(result.iconCode ?? ""),
            ))
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          '${result.main} | ${result.description}',
          style: const TextStyle(
            fontSize: 16.0,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 24.0),
        Table(
          defaultColumnWidth: const FixedColumnWidth(150.0),
          border: TableBorder.all(
              borderRadius: BorderRadius.circular(4),
              color: Colors.orange,
              style: BorderStyle.solid,
              width: 1),
          children: [
            TableRow(children: [
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Temperature',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  '${result.temperature}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold),
                ),
              )
            ]),
            TableRow(children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Pressure',
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${result.pressure}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold),
                ),
              ), // Will be change later
            ]),
            TableRow(children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Humidity',
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${result.humidity}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ), // Will be change later
            ]),
          ],
        )
      ],
    );
  }
}
