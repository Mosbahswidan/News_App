import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/features/home/presentation/views/widgets/sarch_bar_widget.dart';
import 'package:news_app/features/search/presentation/view_model/search_cubit.dart';
import 'package:news_app/features/search/presentation/view_model/search_state.dart';
import 'package:news_app/features/search/presentation/views/widgets/primary_searchtextfield.dart';
import 'package:news_app/features/search/presentation/views/widgets/tab_bar_2.dart';

class SearchViewBody extends StatelessWidget {
  final TextEditingController controller;

  const SearchViewBody({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.size20,
              vertical: 20,
            ),
            child: Column(
              children: [
                GlobalTextField(
                  controller: controller,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  cursorHeight: 25,
                  border: OutlineInputBorder(),
                  prefixIcon: Icons.search,
                  hintText: 'Search',
                  onChanged: (val) {
                    controller.text = val;
                    SearchCubit.get(context).searchNews(searchName: controller.text);
                  },
                  onFieldSubmitted: (val) {
                    controller.text = val;
                    SearchCubit.get(context).searchNews(searchName: controller.text);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                if (state is SearchLoading) LinearProgressIndicator(),
                const SizedBox(
                  height: 20,
                ),
                const Expanded(
                  child: TabBarAndTabViews(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
