import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_size.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final GestureTapCallback? tap;
  //
  const SearchWidget(
      {required this.textController,
      required this.hintText,
      Key? key,
      this.tap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextField(
        controller: textController,
        onChanged: (value) {
          //Do something wi
        },
        decoration: InputDecoration(
          prefixIcon: InkWell(
            onTap: tap,
            child: Icon(
              Icons.search,
              color: Colors.grey[500]!,
            ),
          ),
          //filled: true,
          // fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(fontWeight: FontWeight.w300),
          contentPadding: EdgeInsets.symmetric(
              vertical: AppSize.size20, horizontal: AppSize.size20),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff4E4B66), width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.size10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff4E4B66), width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.size10)),
          ),
        ),
      ),
    );
  }
}
