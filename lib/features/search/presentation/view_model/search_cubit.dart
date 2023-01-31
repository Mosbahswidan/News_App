import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/features/search/data/models/search_model.dart';
import 'package:news_app/features/search/presentation/view_model/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  TextEditingController searchController = TextEditingController();

  NewsModel? searchModel;
  void searchNews({
    String? searchName,
  }) {
    emit(SearchLoading());
    Dio().get('https://newsapi.org/v2/everything?q=$searchName&apiKey=$apiKey').then((value) {
      searchModel = NewsModel.fromJson(value.data);
      debugPrint(searchModel!.status);
      emit(SearchSuccess());
    }).catchError((error) {
      emit(SearchError(error.toString()));
      debugPrint(error.toString());
    });
  }
}
