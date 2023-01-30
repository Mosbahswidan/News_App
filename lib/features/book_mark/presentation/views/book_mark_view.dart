import 'package:flutter/material.dart';
import 'package:news_app/features/book_mark/presentation/views/widgets/book_mark_body.dart';

class BookMarkView extends StatelessWidget {
  const BookMarkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: BookMarkViewBody(),
      ),
    );
  }
}
