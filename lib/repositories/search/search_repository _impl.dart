
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_task/data/models/search_model.dart';
import 'package:weather_task/data/remote/dio_helper.dart';
import 'package:weather_task/repositories/search/search_repository.dart';

import '../../data/remote/endpoints.dart';
import '../../data/remote/failuer.dart';

class  SearchRepositoryImpl implements SearchRepository {
  @override
  Future<Either<String, SearchModel>> getSearchResults(String query) async {


try{
  var res = await DioHelper.getData(
    url: ApiEndPoints.search,
    query: {
      'q': query,
      'appid': ApiEndPoints.openWeatherAPIKey,
    },
  );
  debugPrint(res.data.toString());
  if(res.statusCode == 200){


    SearchModel search = SearchModel.fromJson(res.data);

    return Right(search);
  }else{
    return Left(res.data["message"].toString());
  }
} on DioError catch (e) {
  debugPrint("error : ${e.response?.data}");
  return Left(ServerFailure.fromDiorError(e).message??"Opps There was an Error, Please try again");
}


  }


}