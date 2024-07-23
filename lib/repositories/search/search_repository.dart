import 'package:dartz/dartz.dart';

import '../../data/models/search_model.dart';

abstract class SearchRepository {

  Future<Either<String, SearchModel>> getSearchResults(String query);

}