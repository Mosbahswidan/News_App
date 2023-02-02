import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final GestureTapCallback? tap;

  const SearchWidget({
    required this.textController,
    required this.hintText,
    Key? key,
    this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: const Offset(12, 26),
          blurRadius: 50,
          spreadRadius: 0,
          color: Colors.grey.withOpacity(.1),
        ),
      ]),
      child: TextField(
        controller: textController,
        onChanged: (value) {},
        decoration: InputDecoration(
          prefixIcon: InkWell(
            onTap: tap,
            child: Icon(
              Icons.search,
              color: Colors.grey[500]!,
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(fontWeight: FontWeight.w300),
          contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color(0xff4E4B66), width: 1.0.w),
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color(0xff4E4B66), width: 1.5.w),
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
          ),
        ),
      ),
    );
  }
}
