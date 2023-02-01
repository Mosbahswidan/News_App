import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/core/utils/firestore_services.dart';
import 'package:news_app/features/add_news/presentation/view_models/add_nwes_cubit/add_news_state.dart';
import '../../../../auth/data/models/user_models.dart';
import '../../../data/models/post_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddNewsCubit extends Cubit<AddNewsState> {
  AddNewsCubit() : super(AddNewsInitial());

  static AddNewsCubit get(context) => BlocProvider.of(context);
  FirestoreServices services = FirestoreServices.instance;
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

  void emitScreen() {
    emit(AddNewsEmit());
  }

  UserModel? socialUserModel;

  Future<void> getUserData() async {
    emit(SocialGetUserLoading());
    await FirebaseFirestore.instance.collection('users').doc(uID).get().then((value) {
      socialUserModel = UserModel.fromJson(value.data()!);
      emit(SocialGetUserSuccsess());
    }).catchError((error) {
      print(error);
      emit(SocialGetUserError(error.toString()));
    });
  }

  void createPost({
    required String title,
    required String content,
    String? postimage,
  }) {
    emit(SocialCreatePostLoading());
    PostModel model = PostModel(
      name: socialUserModel!.fullName,
      uId: uID,
      image: socialUserModel!.image,
      title: title,
      content: content,
      postImage: postimage ?? '',
    );
    FirebaseFirestore.instance.collection('posts').add(model.toMap()).then((value) {
      emit(SocialCreatePostSucces());
    }).catchError((error) {
      emit(SocialCreatePostError());
    });
  }

  void uploadPostPost({
    required String title,
    required String content,
  }) {
    emit(SocialCreatePostLoading());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(image!.path).pathSegments.last}')
        .putFile(image!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        createPost(
          title: title,
          content: content,
          postimage: value,
        );
      }).catchError((error) {
        emit(SocialCreatePostError());
      });
    }).catchError((error) {
      emit(SocialCreatePostError());
    });
  }

  List<PostModel> posts = [];
  //List<String> postId = [];

  Future<void> getPosts() async {
    emit(SocialGetPostsLoading());
    FirebaseFirestore.instance.collection('posts').get().then((value) {
      for (var element in value.docs) {
        if (element.data()['uId'] == uID) {
          posts.add(PostModel.fromJson(element.data()));
        }
      }
      emit(SocialGetPostsSuccsess());
    }).catchError((error) {
      emit(SocialGetPostsError(error.toString()));
    });
  }
  // Future<void> getPosts() async {
  //    FirebaseFirestore.instance
  //       .collection('posts')
  //       .get()
  //       .then((value) {

  //          value.docs.forEach((element)
  //          {
  //            element.reference
  //                .collection('Like')
  //                .get()
  //                .then((value){

  //              posts.add(PostModel.fromJson(element.data()));
  //              postId.add(element.id);
  //            })
  //                .catchError((error){
  //              print(error.toString());
  //            });

  //         }

  //         );

  //          //getComment();
  //   }
  //   )
  //       .catchError((error){
  //         emit(SocialGetPostError(error.toString()));
  //   });

  // }
}
