import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_task/data/models/details_model.dart';
import 'package:weather_task/repositories/details/details_repository%20_impl.dart';

import '../../../data/models/forecast_days_model.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());

  DetailsRepositoryImpl detailsRepositoryImpl = DetailsRepositoryImpl();

  Future<void> initDetails({required double lat, required double lon}) async {
   await Future.wait([
      getWeatherDetails(lat: lat, lon: lon),
      getForecastDaysDetails(lat: lat, lon: lon),
    ]);
    emit(InitDetails());


  }

  DetailsModel detailsModel = DetailsModel();
 Future<void> getWeatherDetails({required double lat, required double lon}) async {
    emit(DetailsLoading());

    final result =  await detailsRepositoryImpl.getDetails(lat: lat, lon: lon);
    result.fold((l) {
      emit(DetailsError(message: l));
    }, (r) {
      print("detailsModel cubit : ${r.weather?.first.icon}");
      detailsModel = r;
      emit(DetailsSuccess(detailsModel: r));
    });

  }

 Future<void> getForecastDaysDetails({required double lat, required double lon}) async {


    emit(ForecastDaysLoading());
    final result =  await detailsRepositoryImpl.getForecastDaysDetails(lat: lat, lon: lon);
    result.fold((l) {
      emit(ForecastDaysError(message: l));
    }, (r) {

      emit(ForecastDaysSuccess(forecastModel: r));
    });

}}
