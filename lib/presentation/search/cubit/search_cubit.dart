import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../data/models/search_model.dart';
import '../../../repositories/search/search_repository _impl.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  SearchRepositoryImpl searchRepository = SearchRepositoryImpl();


  // controllers
  var searchController = TextEditingController();

  //functions
  Future<void> getSearchResults(String query) async {
    emit(SearchLoading());
    final result = await searchRepository.getSearchResults(query);
    result.fold((l) {
      emit(SearchError(l));
    }, (r) {


      emit(SearchSuccess(r.listCity??[]));
    });
  }
}
