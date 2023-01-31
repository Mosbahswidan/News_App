import 'package:flutter/material.dart';
import 'package:news_app/features/search/presentation/view_model/search_cubit.dart';
import 'package:news_app/features/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SearchCubit cubit = SearchCubit.get(context);
    return Scaffold(
      body: SearchViewBody(controller: cubit.searchController),
    );
  }
}
