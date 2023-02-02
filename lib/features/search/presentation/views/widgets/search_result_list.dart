import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/search/presentation/view_model/search_cubit.dart';
import 'package:news_app/features/search/presentation/view_model/search_state.dart';
import 'package:news_app/features/search/presentation/views/widgets/search_item.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        SearchCubit cubit = SearchCubit.get(context);
        return cubit.searchModel == null
            ? const SizedBox()
            : ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: cubit.searchModel!.articles!.length,
                itemBuilder: (context, index) => SearchItem(
                  model: cubit.searchModel?.articles![index],
                ),
                separatorBuilder: (context, index) =>  SizedBox(height: 5.h),
              );
      },
    );
  }
}
