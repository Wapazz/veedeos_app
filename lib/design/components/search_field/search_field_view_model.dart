import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_field_state.dart';

class SearchFieldViewModel extends Cubit<SearchFieldState> {
  SearchFieldViewModel(this.onSearch) : super(SearchFieldState());

  final void Function(String) onSearch;

  void setEmpty(bool isEmpty) {
    emit(SearchFieldState(isEmpty: isEmpty));
  }

  void onClearSearchField() {
    if (state.shouldRefresh) {
      onSearch('');
    }
    emit(SearchFieldState(isEmpty: true, shouldRefresh: false));
  }

  void search(String value) {
    emit(SearchFieldState(isEmpty: false, shouldRefresh: true));
    onSearch(value);
  }
}
