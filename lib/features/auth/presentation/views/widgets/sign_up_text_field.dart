import 'package:news_app/core/utils/export.dart';
import 'package:news_app/core/utils/functions.dart';
import 'package:news_app/features/auth/presentation/views/widgets/my_text_field.dart';

class SignUpTextField extends StatelessWidget {
  final String? fieldTitle;
  final String? hintText;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final bool? obsecure;

  const SignUpTextField({
    super.key,
    this.fieldTitle,
    required this.controller,
    this.textInputType,
    this.obsecure,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldTitle ?? "Text",
            style: const TextStyle(
              color: kSecondaryColor,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextField(
            hintText: hintText ?? 'hint',
            controller: controller,
            textInputType: textInputType,
            obsecure: obsecure ?? false,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'fill this field';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
