import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/features/explore/presentation/view_model/explore_state.dart';
import 'package:news_app/features/search/data/models/search_model.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit() : super(ExploreInitial());

  static ExploreCubit get(context) => BlocProvider.of(context);

  SearchModel? popularModel;
  void getPopular() {
    emit(ExploreGetPopularLoading());
    Dio().get('https://newsapi.org/v2/everything?q=popular&apiKey=$apiKey').then((value) {
      popularModel = SearchModel.fromJson(value.data);
      debugPrint(popularModel!.status);
      emit(ExploreGetPopularSuccess());
    }).catchError((error) {
      emit(ExploreGetPopularError(error.toString()));
      debugPrint(error.toString());
    });
  }
}
