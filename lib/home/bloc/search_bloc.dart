import 'dart:async';

import 'package:buscaceowithbloc/home/bloc/search_event.dart';
import 'package:buscaceowithbloc/home/bloc/search_state.dart';
import 'package:buscaceowithbloc/model/cep_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchFetch>(getCep);
  }

  getCep(SearchFetch event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    try {
      final response =
          await Dio().get('https://viacep.com.br/ws/${event.cep}/json/');
      emit(
        SearchSuccess(
          cep: CepModel(response.data['localidade']),
        ),
      );
    } catch (e) {
      emit(
        SearchError('Cep inválido ou sem acesso a internet'),
      );
    }
  }
}
