import 'package:flutter/material.dart';
import 'package:news_app/features/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  final TextEditingController controller;
  const SearchView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchViewBody(controller: controller),
    );
  }
}
