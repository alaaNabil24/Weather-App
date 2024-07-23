import 'package:dartz/dartz.dart';

import '../../data/models/details_model.dart';
import '../../data/models/forecast_days_model.dart';

abstract class DetailsRepository {

  Future<Either<String, DetailsModel>> getDetails({ required double lat ,  required double lon });

  Future<Either<String, ForecastModel>> getForecastDaysDetails({required double lat, required double lon});
}