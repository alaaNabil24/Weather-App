

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../constant/fun_helper.dart';

class DetailsCard extends StatelessWidget {
  const  DetailsCard({super.key, this.maxTemp, this.minTemp, this.weatherIcon, this.weatherDescription, this.cityName});

  final maxTemp;
  final minTemp;
  final weatherIcon;
  final weatherDescription;
  final cityName;
  @override
  Widget build(BuildContext context) {
    return  ListTile(




      subtitle: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('City: ${cityName??""}'),
          const  SizedBox(
            height: 10,
          ),
          Text('Max: ${maxTemp??"0"}°C, Min: ${minTemp??"0"}°C'),

        const  SizedBox(
            height: 10,
          ),
          Image.network(getWeatherIconUrl("01n"??"")),

         const SizedBox(
            height: 10,
          ),
          Text(weatherDescription??""),
        ],
      ),
    );

  }
}
