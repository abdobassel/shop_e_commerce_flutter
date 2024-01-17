part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  List<SarchModel> searchs;
  SearchSuccess(this.searchs);
}

class SearchError extends SearchState {
  final String error;
  SearchError(this.error);
}
