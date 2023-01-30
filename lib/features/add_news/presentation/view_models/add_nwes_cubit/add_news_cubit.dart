import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'add_news_state.dart';

class AddNewsCubit extends Cubit<AddNewsState> {
  AddNewsCubit() : super(AddNewsInitial());
  static AddNewsCubit get(context) => BlocProvider.of(context);
  File? image;
  final imagepicker = ImagePicker();
  uploadImage() async {
    //final imagepicker = ImagePicker();
    var pickedImage = await imagepicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      emit(AddNewsPickImageSuccess());
    } else {}
  }
}
