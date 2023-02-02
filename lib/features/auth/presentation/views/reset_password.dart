import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/auth/presentation/view_models/reset_pass_cubit/reset_password_cubit.dart';
import 'package:news_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:news_app/features/auth/presentation/views/widgets/reset_password_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: ResetPasswordBody(
          controller: emailController,
          keyd: formKey,
        ),
      ),
      bottomSheet: SizedBox(
        height: 100,
        child: Center(
            child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {},
          builder: (context, state) {
            return state is ResetPasswordLoading
                ? const CircularProgressIndicator()
                : Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        text: "Submit",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            ResetPasswordCubit.get(context).resetPassword(
                              email: emailController.text.trim(),
                              context: context,
                            );
                          }
                        },
                      ),
                    ),
                  );
          },
        )),
      ),
    );
  }
}
