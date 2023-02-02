import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/on_boarding/data/models/slider_model.dart';

class PageViewItem extends StatelessWidget {
  final SliderModel model;
  const PageViewItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 1.7,
          model.imageString,
          fit: BoxFit.fill,
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Text(
            model.title,
            style: const TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Text(
            model.subTitle,
            style:
                TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: const Color(0xff4E4B66)),
          ),
        ),
      ],
    );
  }
}
