part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {}

class SearchError extends SearchState {
  final String error;
  SearchError(this.error);
}
