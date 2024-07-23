import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_task/data/remote/dio_helper.dart';
import 'package:weather_task/presentation/search/pages/weather_search_page.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner:  false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: WeatherSearchPage(),
    );
  }
}


