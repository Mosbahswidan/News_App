import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              horizontal: 20.w,
              vertical: 20.h,
            ),
            child: Column(
              children: [
                GlobalTextField(
                  controller: controller,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  cursorHeight: 25,
                  border: const OutlineInputBorder(),
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
                SizedBox(
                  height: 10.h,
                ),
                if (state is SearchLoading) const LinearProgressIndicator(),
                SizedBox(height: 20.h),
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
