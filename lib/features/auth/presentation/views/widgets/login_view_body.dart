import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/app_size.dart';
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
    var _formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(
              left: AppSize.size20, right: AppSize.size20, top: AppSize.size40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hello",
                style: TextStyle(
                    color: Color(0xff050505),
                    fontWeight: FontWeight.bold,
                    fontSize: 46),
              ),
              SizedBox(
                height: AppSize.size10,
              ),
              const Text(
                "Again!",
                style: TextStyle(
                    color: Color(0xff1877F2),
                    fontWeight: FontWeight.bold,
                    fontSize: 46),
              ),
              SizedBox(
                height: AppSize.size15,
              ),
              const Text(
                "Welcome back you’ve\nbeen missed",
                style: TextStyle(fontSize: 20, color: Color(0xff4E4B66)),
              ),
              SizedBox(
                height: AppSize.size50,
              ),
              const Text(
                "Email",
                style: TextStyle(color: Color(0xff4E4B66), fontSize: 17),
              ),
              SizedBox(
                height: AppSize.size10,
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
                height: AppSize.size20,
              ),
              const Text(
                "Password",
                style: TextStyle(color: Color(0xff4E4B66), fontSize: 17),
              ),
              SizedBox(
                height: AppSize.size10,
              ),
              MyTextField(
                hintText: "Password",
                controller: passwordController,
                obsecure: true,
                validator: (value) {
                  return validatePassword(value);
                },
              ),
              SizedBox(
                height: AppSize.size10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Remember me",
                    style: TextStyle(color: Color(0xff4E4B66)),
                  ),
                  InkWell(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kResetPassword);
                    },
                    child: const Text(
                      "Reset password",
                      style: TextStyle(color: Color(0xff1877F2)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.size20,
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
                              if (_formKey.currentState!.validate()) {
                                LoginCubit.get(context).signIn(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim());
                              }
                            },
                          ),
                        );
                },
              ),
              SizedBox(
                height: AppSize.size15,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: "Dont have an account? ",
                      style: const TextStyle(
                          color: Color(0xff667080), fontSize: 14),
                      children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                GoRouter.of(context)
                                    .pushReplacement(AppRouter.kSignUpView);
                              },
                            text: "Sign up",
                            style: const TextStyle(
                                color: Color(0xff1877F2),
                                fontSize: 14,
                                fontWeight: FontWeight.w600))
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
