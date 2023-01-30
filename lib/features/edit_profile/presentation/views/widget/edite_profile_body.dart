import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/features/auth/presentation/views/widgets/my_text_field.dart';

class EditProfileBody extends StatelessWidget {
  EditProfileBody({super.key});

  final TextEditingController cont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.size20,
          vertical: AppSize.size20,
        ),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: 125,
                width: 120,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg?w=740&t=st=1675087563~exp=1675088163~hmac=8d2ab0f6797bc3c6b9568c101ef8a56f7b4ab707fad6b35faeaa788bc14e0eea'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 4.0,
                        bottom: 2.0,
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            radius: 18,
                            child: Center(
                              child: Icon(
                                Icons.camera_alt_outlined,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            MyTextField(
              controller: cont,
              hintText: 'Enter username',
              obsecure: false,
              textInputType: TextInputType.name,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              controller: cont,
              hintText: 'Enter full name',
              obsecure: false,
              textInputType: TextInputType.name,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              controller: cont,
              hintText: 'Enter email address',
              obsecure: false,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              controller: cont,
              hintText: 'Enter phone number',
              obsecure: false,
              textInputType: TextInputType.phone,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              controller: cont,
              hintText: 'Enter bio',
              obsecure: false,
              textInputType: TextInputType.text,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              controller: cont,
              hintText: 'Enter website',
              obsecure: false,
              textInputType: TextInputType.url,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
