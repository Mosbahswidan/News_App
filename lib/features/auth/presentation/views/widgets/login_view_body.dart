import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/functions.dart';
import 'package:news_app/core/widgets/custom_snack_bar.dart';
import 'package:news_app/features/auth/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:news_app/features/auth/presentation/views/widgets/button_2.dart';
import 'package:news_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:news_app/features/auth/presentation/views/widgets/my_text_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 30.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                "Again!",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: const Color(0xff1877F2)),
              ),
              SizedBox(
                height: 14.h,
              ),
              Text(
                "Welcome back you’ve\nbeen missed",

                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Email",

                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 16.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              MyTextField(
                hintText: "Email",
                controller: emailController,
                obsecure: false,
                validator: (value) {
                  return validateEmail(value);
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Password",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 16.sp),
              ),
              SizedBox(
                height: 12.h,
              ),
              MyTextField(
                hintText: "Password",
                controller: passwordController,
                obsecure: true,
                validator: (value) {
                  return null;
                },
              ),
              SizedBox(
                height: 14.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Remember me",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 16),
                  ),
                  InkWell(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kResetPassword);
                    },
                    child: Text(
                      "Reset password",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 16, color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginError) {
                    customSnackBar(context, "email or password invalid");
                  }
                },
                builder: (context, state) {
                  return state is LoginLoading
                      ? const Center(
                          child: CustomIndecator(
                          currentDotColor: Colors.blue,
                          defaultDotColor: Colors.grey,
                          numDots: 5,
                        ))
                      : SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            text: "Login",
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).signIn(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                    context: context);
                              }
                            },
                          ),
                        );
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: "Dont have an account? ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 14.sp),
                      children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                GoRouter.of(context)
                                    .pushReplacement(AppRouter.kSignUpView);
                              },
                            text: "Sign up",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontSize: 16.sp, color: Colors.blue))
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
