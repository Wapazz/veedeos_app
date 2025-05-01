import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veedeos_app/design/components/search_field/search_field_view_model.dart';

class SearchField extends StatelessWidget {
  SearchField({super.key, required this.onSearch}) {
    _viewModel = SearchFieldViewModel(onSearch);
  }

  final void Function(String) onSearch;

  final TextEditingController _searchController = TextEditingController();
  late final SearchFieldViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchFieldViewModel, SearchFieldState>(
      bloc: _viewModel,
      builder: (context, state) {
        return TextFormField(
          controller: _searchController,
          onTapOutside: (_) {
            FocusScope.of(context).unfocus();
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsetsDirectional.zero,
            hintText: 'Search videos',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: state.isEmpty
                ? null
                : IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      _viewModel.onClearSearchField();
                    },
                  ),
          ),
          onFieldSubmitted: (value) => _viewModel.search(value),
          onChanged: (value) {
            _viewModel.setEmpty(value.isEmpty);
          },
        );
      },
    );
  }
}
