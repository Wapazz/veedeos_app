part of 'search_field_view_model.dart';

final class SearchFieldState {
  final bool isEmpty;
  final bool shouldRefresh;

  SearchFieldState({this.isEmpty = true, this.shouldRefresh = false});
}
