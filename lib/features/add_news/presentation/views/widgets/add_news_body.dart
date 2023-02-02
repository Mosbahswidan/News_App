import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/export.dart';
import 'package:news_app/features/add_news/presentation/view_models/add_nwes_cubit/add_news_state.dart';

class AddNewsBody extends StatelessWidget {
  const AddNewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController newsTitleController = TextEditingController();
    final TextEditingController newsController = TextEditingController();
    debugPrint(AddNewsCubit.get(context).image.toString());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
                    height: 250.h,
                    width: double.infinity,
                    color: kSecondaryColor,
                    child: AddNewsCubit.get(context).image == null
                        ? Center(
                            child: Text(
                              "Add Cover Photo",
                              style: TextStyle(fontSize: 18.sp),
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
                height: 20.h,
              ),
              TextField(
                onChanged: (value) {
                  AddNewsCubit.get(context).emitScreen();
                },
                controller: newsTitleController,
                style: TextStyle(fontSize: 20.sp),
                decoration: InputDecoration(
                  hintText: "News Title",
                  hintStyle: TextStyle(fontSize: 20.sp),
                ),
              ),
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    AddNewsCubit.get(context).emitScreen();
                  },
                  controller: newsController,
                  style: TextStyle(fontSize: 20.sp),
                  decoration: InputDecoration(
                    hintText: "Add News",
                    hintStyle: TextStyle(
                      fontSize: 16.sp,
                    ),
                    border: InputBorder.none,
                  ),
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
                            height: 50.h,
                            width: 100.w,
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
                                child: const Text("Publish"),
                              ),
                            ))
                        : SizedBox(
                            height: 50.h,
                            width: 100.w,
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
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: 100.w,
                      child: const LinearProgressIndicator(),
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
