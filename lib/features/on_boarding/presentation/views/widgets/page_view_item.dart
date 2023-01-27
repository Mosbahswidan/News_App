import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/features/on_boarding/data/models/slider_model.dart';

import '../../../../../core/utils/assets_data.dart';

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
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            model.title,
            style: const TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            model.subTitle,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff4E4B66)),
          ),
        ),
      ],
    );
  }
}
