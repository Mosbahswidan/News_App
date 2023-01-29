import 'package:flutter/material.dart';
import 'package:news_app/features/explore/presentation/views/widgets/explore_body.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: ExploreViewBody(),
      ),
    );
  }
}
