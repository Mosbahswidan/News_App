import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/features/news_details/presentation/views/widgets/news_details_body.dart';
import 'package:news_app/features/news_details/presentation/views/widgets/news_details_bottom.dart';
import 'package:news_app/features/search/data/models/search_model.dart';

class NewsDetailsView extends StatelessWidget {
  final News? model;
  const NewsDetailsView({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kSecondaryColor,
            size: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: kSecondaryColor,
              size: 25,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: kSecondaryColor,
              size: 25,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: NewsDetailsViewBody(model: model),
      ),
      bottomNavigationBar: const NewsDetailsBottom(),
    );
  }
}
