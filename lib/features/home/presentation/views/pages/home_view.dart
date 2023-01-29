import 'package:flutter/material.dart';
import 'package:news_app/features/home/presentation/views/widgets/home_view_body.dart';

class HomeViwe extends StatelessWidget {
  const HomeViwe({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: HomeViewBody(),
      ),
    );
  }
}
