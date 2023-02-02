import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/features/news_details/presentation/views/widgets/comments_bottom.dart';
import 'package:news_app/features/news_details/presentation/views/widgets/comments_item.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            // color: kSecondaryColor,
            size: 25,
          ),
        ),
        title: const Text(
          'Comments',
          style: TextStyle(
              //  color: Colors.black,
              ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.size15,
            vertical: AppSize.size15,
          ),
          child: Column(
            children: [
              Column(
                children: const [
                  CommentItem(
                    authorImage:
                        'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=740&t=st=1675078027~exp=1675078627~hmac=244215a6ee4b71ec62959941428c2037e0944d843e6c3b433257ba8f72053339',
                    authorName: 'Wilson Franci',
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.only(left: 50.0),
                    child: CommentItem(
                      authorName: 'Madelyn Saris',
                      authorImage:
                          'https://img.freepik.com/free-photo/portrait-attractive-adult-girl-with-ginger-curly-hair-wearing-green-turtleneck-sweater-feels-warm-touching-her-cheeks-watching-up-isolated-closeup-pastel-pink-wall_295783-15310.jpg',
                    ),
                  ),
                ],
              ),
              const CommentItem(
                authorName: 'Marley Botosh',
                authorImage:
                    'https://img.freepik.com/free-photo/positive-joyful-attractive-young-female-with-loose-hair-looking-with-satisfaction-smiling-playfully-being-happy-dressed-marsala-turtleneck-knitted-sweater-posing-blank-stuido-wall_343059-3261.jpg?w=740&t=st=1675078146~exp=1675078746~hmac=18d13c174012c08119f13ac3634d177357c0f9145c268a0edc4b46d9dfb7396c',
              ),
              const CommentItem(
                authorImage:
                    'https://img.freepik.com/premium-photo/handsome-confident-businessman-wearing-suit-standing-isolated-black-wall-arms-folded_171337-93222.jpg?w=740',
                authorName: 'Alfonso Septimus',
              ),
              const CommentItem(
                authorName: 'Omar Herwitz',
                authorImage:
                    'https://img.freepik.com/free-photo/close-up-businessman-with-hands-crossed-smiling_158595-3406.jpg?w=740&t=st=1675078226~exp=1675078826~hmac=cdccc8b338424cfaee2e9272be918b48dd372560112017b8da6a493fe883560a',
              ),
              const CommentItem(
                authorName: 'Corey Geidt',
                authorImage:
                    'https://img.freepik.com/premium-photo/studio-shot-handsome-senior-businessman-with-mustache-wearing-eyeglasses-against-brown_251136-12410.jpg',
              ),
              const CommentItem(),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
      bottomSheet: CommentsBottom(),
    );
  }
}
