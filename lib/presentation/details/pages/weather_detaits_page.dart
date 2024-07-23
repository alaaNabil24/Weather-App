import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_task/presentation/details/cubit/details_cubit.dart';

import '../../../data/models/search_model.dart';
import '../widgets/details_card.dart';

class WeatherDetailsPage extends StatelessWidget {
  const WeatherDetailsPage({super.key, required this.coord});

  final Coord coord;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            DetailsCubit()..getWeatherDetails(lat: coord.lat!, lon: coord.lon!)..getForecastDaysDetails(lat:  coord.lat!, lon: coord.lon!),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: const Text("Weather Details"),
            ),
            body:BlocBuilder<DetailsCubit, DetailsState>(
  builder: (context, state) {
    var cubit = BlocProvider.of<DetailsCubit>(context);
    return RefreshIndicator(
              onRefresh: () async {

                BlocProvider.of<DetailsCubit>(context).getForecastDaysDetails(lat:  coord.lat!, lon: coord.lon!);

              },
              child: SingleChildScrollView(
                physics:  AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                state is DetailsSuccess || state is ForecastDaysSuccess
                ? Padding(
                padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Crrent Weather", style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(
                      height: 10,
                    ),
                    DetailsCard(
                      maxTemp: cubit.detailsModel.main?.tempMax,
                      minTemp: cubit.detailsModel.main?.tempMin,
                      weatherIcon:
                      cubit.detailsModel.weather?.first.icon,
                      weatherDescription: cubit.detailsModel
                          .weather?.first.description,
                      cityName:  cubit.detailsModel.name,
                    ),
                  ],
                ),
              )
            : state is DetailsLoading
    ? const Center(child: CircularProgressIndicator())
        : state is DetailsError
    ? Center(
    child: Text(
    state.message,
    style: const TextStyle(color: Colors.red),
    ))
        : Container(),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<DetailsCubit, DetailsState>(builder: (context, state) {
    return  state is ForecastDaysSuccess
    ? Column(
    children: [
    Text("Days Forecast List", style: Theme.of(context).textTheme.titleLarge),
    const SizedBox(

    height: 10,
    ),
    ListView.separated(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (itemBuilder, index) => DetailsCard(
    maxTemp: state.forecastModel
        .listData![index].main?.tempMax,
    minTemp: state.forecastModel
        .listData![index].main?.tempMin,
    weatherIcon: state.forecastModel
        .listData![index].weather?.first.icon,
    weatherDescription: state
        .forecastModel
        .listData![index]
        .weather
        ?.first
        .description,
    cityName:  state.forecastModel.city?.name,
    ),
    separatorBuilder: (context, index) => Column(
    children: [
    const SizedBox(
    height: 10,
    ),
    Divider(
    color: Colors.grey.shade300,
    )
    ],
    ),
    itemCount: state.forecastModel.listData!.length),
    ],
    )
        : state is ForecastDaysError
    ? Center(child: Text(state.message))
        : state is ForecastDaysLoading
    ? const Center(
    child: CircularProgressIndicator())
        : const Text("error");
                    })
                  ],
                ),
              ),
            );
  },
)));
  }
}
