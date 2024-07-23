part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}
class InitDetails extends DetailsState {}
class DetailsLoading extends DetailsState {}
class DetailsSuccess extends DetailsState {

  DetailsModel detailsModel;
  DetailsSuccess({required this.detailsModel});
}
class DetailsError extends DetailsState {

  String message;
  DetailsError({required this.message});
}
class ForecastDaysLoading extends DetailsState {}
class ForecastDaysSuccess extends DetailsState {
  ForecastModel forecastModel;
  ForecastDaysSuccess({required this.forecastModel});
}
class ForecastDaysError extends DetailsState {
  String message;
  ForecastDaysError({required this.message});
}
