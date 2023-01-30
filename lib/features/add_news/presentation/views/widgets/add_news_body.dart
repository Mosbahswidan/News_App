import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/features/add_news/presentation/view_models/add_nwes_cubit/add_news_cubit.dart';

class AddNewsBody extends StatelessWidget {
  const AddNewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController newsTitleController = TextEditingController();
    final TextEditingController newsController = TextEditingController();
    print(AddNewsCubit.get(context).image);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          DottedBorder(
            color: Colors.black,
            padding: const EdgeInsets.all(2),
            strokeWidth: 1,
            borderType: BorderType.RRect,
            dashPattern: const [20, 3],
            child: BlocBuilder<AddNewsCubit, AddNewsState>(
              builder: (context, state) {
                return InkWell(
                  onTap: AddNewsCubit.get(context).uploadImage,
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    color: const Color(0xffEEF1F4),
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
                );
              },
            ),
          ),
          SizedBox(
            height: AppSize.size20,
          ),
          TextField(
            controller: newsTitleController,
            style: const TextStyle(fontSize: 20),
            decoration: const InputDecoration(
              hintText: "News Title",
              hintStyle: TextStyle(fontSize: 20),
            ),
          ),
          BlocConsumer<AddNewsCubit, AddNewsState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return Expanded(
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
              );
            },
          ),
          BlocConsumer<AddNewsCubit, AddNewsState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return Container(
                height: 70,
                color: Colors.white,
                child: Row(
                  children: [
                    const Spacer(),
                    newsController.text.isEmpty &&
                            newsTitleController.text.isEmpty &&
                            AddNewsCubit.get(context).image == null
                        ? SizedBox(
                            height: 50,
                            width: 100,
                            child: ElevatedButton(
                              onPressed: null,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xffEEF1F4)),
                              child: const Text(
                                "Publish",
                                style: TextStyle(color: Color(0xff667080)),
                              ),
                            ))
                        : SizedBox(
                            height: 50,
                            width: 100,
                            child: ElevatedButton(
                                onPressed: () {
                                  print(newsTitleController.text.isEmpty);
                                },
                                child: const Text("Publish"))),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
