
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:weather_task/data/models/details_model.dart';
import 'package:weather_task/data/models/forecast_days_model.dart';

import '../../data/remote/dio_helper.dart';
import '../../data/remote/endpoints.dart';
import '../../data/remote/failuer.dart';
import 'details_repository.dart';

class  DetailsRepositoryImpl implements DetailsRepository {
  @override
  Future<Either<String, DetailsModel>> getDetails({required double lat, required double lon}) async {
    try{
      var res = await DioHelper.getData(
        url: ApiEndPoints.details,
        query: {
          'lat': lat,
          "lon": lon,
          "units" : "metric",
          'appid': ApiEndPoints.openWeatherAPIKey,
        },
      );

      if(res.statusCode == 200){




        DetailsModel   detailsModel = DetailsModel.fromJson(res.data);
        if (kDebugMode) {
          print("detailsModel repo : ${detailsModel.weather?.first.description}");
          print("details res repo : ${res.data}");
        }
        return Right(detailsModel);
      }else{
        return Left(res.data["message"].toString());
      }
    } on DioError catch (e) {
      debugPrint("error : ${e.response?.data}");
      return Left(ServerFailure.fromDiorError(e).message??"Opps There was an Error, Please try again");
    }
  }

  @override
  Future<Either<String, ForecastModel>> getForecastDaysDetails({required double lat, required double lon}) async {
    try{
      var res = await DioHelper.getData(
        url: ApiEndPoints.forecast,
        query: {
          'lat': lat,
          "lon": lon,
           "cnt":5,
          'appid': ApiEndPoints.openWeatherAPIKey,
        },
      );

      if(res.statusCode == 200){





        if (kDebugMode) {
          print("details res repo : ${res.data}");
        }
        return Right(ForecastModel.fromJson(res.data));
      }else{
        return Left(res.data["message"].toString());
      }
    } on DioError catch (e) {
      debugPrint("error : ${e.response?.data}");
      return Left(ServerFailure.fromDiorError(e).message??"Opps There was an Error, Please try again");
    }
  }


}