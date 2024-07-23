

import 'package:flutter/material.dart';
import 'package:weather_task/constant/fun_helper.dart';
import 'package:weather_task/presentation/details/pages/weather_detaits_page.dart';

import '../../../data/models/search_model.dart';

class CityCardWidget extends StatelessWidget {
  const CityCardWidget({super.key, required this.city});

  final ListCity city;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
navTo(context, WeatherDetailsPage(coord: city.coord!));
      },
      child: Card(


        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Text("City Name : ${city.name}" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 20),),
           const SizedBox(height: 10,),
            Text("temperature : ${city.main?.temp}" , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.bold , fontSize: 16),),
            const SizedBox(height: 10,),

            Text(" Description: ${city.weather?.first.description??""}" , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.bold , fontSize: 20),),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
