import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/core/utils/export.dart';
import 'package:news_app/features/add_news/presentation/view_models/add_nwes_cubit/add_news_cubit.dart';
import 'package:news_app/features/add_news/presentation/view_models/add_nwes_cubit/add_news_state.dart';

class AddNewsBody extends StatelessWidget {
  const AddNewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController newsTitleController = TextEditingController();
    final TextEditingController newsController = TextEditingController();
    debugPrint(AddNewsCubit.get(context).image.toString());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: BlocConsumer<AddNewsCubit, AddNewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              DottedBorder(
                color: Colors.grey,
                padding: const EdgeInsets.all(2),
                strokeWidth: 1,
                borderType: BorderType.RRect,
                dashPattern: const [20, 3],
                child: InkWell(
                  onTap: AddNewsCubit.get(context).uploadImage,
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    color: kSecondaryColor,
                    child: AddNewsCubit.get(context).image == null
                        ? const Center(
                            child: Text(
                              "Add Cover Photo",
                              style: TextStyle(fontSize: 18),
                            ),
                          )
                        : Image.file(
                            AddNewsCubit.get(context).image!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: AppSize.size20,
              ),
              TextField(
                onChanged: (value) {
                  AddNewsCubit.get(context).emitScreen();
                },
                controller: newsTitleController,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                  hintText: "News Title",
                  hintStyle: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    AddNewsCubit.get(context).emitScreen();
                  },
                  controller: newsController,
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                      hintText: "Add News",
                      hintStyle: TextStyle(
                        fontSize: 16,
                      ),
                      border: InputBorder.none),
                ),
              ),
              Container(
                height: 70,
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Row(
                  children: [
                    const Spacer(),
                    newsController.text.isNotEmpty &&
                            newsTitleController.text.isNotEmpty &&
                            AddNewsCubit.get(context).image != null
                        ? SizedBox(
                            height: 50,
                            width: 100,
                            child: StreamBuilder(
                              stream: AddNewsCubit.get(context).getUserData(),
                              builder: (context, snapshot) => ElevatedButton(
                                  onPressed: () {
                                    AddNewsCubit.get(context).uploadPostPost(
                                      title: newsTitleController.text,
                                      content: newsController.text,
                                      userName: snapshot.data!.fullName!,
                                      userImage: snapshot.data!.image!,
                                    );
                                  },
                                  child: const Text("Publish")),
                            ))
                        : SizedBox(
                            height: 50,
                            width: 100,
                            child: ElevatedButton(
                              onPressed: null,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffEEF1F4)),
                              child: const Text(
                                "Publish",
                                style: TextStyle(color: Color(0xff667080)),
                              ),
                            )),
                  ],
                ),
              ),
              if (state is SocialCreatePostLoading)
                Row(
                  children: const [
                    Spacer(),
                    SizedBox(
                      width: 100,
                      child: LinearProgressIndicator(),
                    ),
                  ],
                )
            ],
          );
        },
      ),
    );
  }
}
