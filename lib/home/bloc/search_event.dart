abstract class SearchEvent {}

class SearchFetch implements SearchEvent {
  final String cep;

  SearchFetch(this.cep);
}