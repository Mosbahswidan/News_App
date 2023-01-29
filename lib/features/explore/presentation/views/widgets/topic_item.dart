import 'package:flutter/material.dart';
import 'package:news_app/features/explore/presentation/views/widgets/save_button.dart';

class TopicItem extends StatelessWidget {
  final String? topicImage;
  final String? topicName;
  final String? topicDescription;
  final Function()? saveTap;
  final bool? saved;

  const TopicItem({
    super.key,
    this.topicImage,
    this.topicDescription,
    this.topicName,
    this.saveTap,
    this.saved = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(10),
              child: Image(
                height: 95,
                width: 100,
                fit: BoxFit.cover,
                image: NetworkImage(
                  topicImage ??
                      'https://img.freepik.com/free-photo/brunette-blogger-posing-photo_23-2148192222.jpg?w=740&t=st=1675010200~exp=1675010800~hmac=0918efacf22aecc9dc7a4c3f54fbfc3526773d2aef6543aa6e168e4ef4628537',
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: SizedBox(
                width: 140,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topicName ?? 'Topic name',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      topicDescription ?? 'Topic Description',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF4E4B66),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            SaveButton(
              onTap: saveTap,
              saved: saved,
            ),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(10),
            //   child: SizedBox(
            //     width: 80,
            //     height: 45,
            //     child: ElevatedButton(
            //       onPressed: () {},

            //       child: Text(
            //         'Save',
            //         style: TextStyle(
            //           fontSize: 18,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
