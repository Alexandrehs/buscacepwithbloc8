import 'package:buscaceowithbloc/model/cep_model.dart';

abstract class SearchState {}

class SearchInitial implements SearchState {}

class SearchLoading implements SearchState {}

class SearchSuccess implements SearchState {
  final CepModel cep;

  SearchSuccess({required this.cep});
}

class SearchError implements SearchState {
  final String message;

  SearchError(this.message);
}