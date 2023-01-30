import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/features/news_details/presentation/views/widgets/news_details_body.dart';
import 'package:news_app/features/news_details/presentation/views/widgets/news_details_bottom.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({super.key});

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
        child: NewsDetailsViewBody(),
      ),
      bottomNavigationBar: const NewsDetailsBottom(),
    );
  }
}
