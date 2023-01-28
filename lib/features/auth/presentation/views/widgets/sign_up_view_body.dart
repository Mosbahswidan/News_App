import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/core/utils/functions.dart';
import 'package:news_app/core/widgets/custom_snack_bar.dart';
import 'package:news_app/features/auth/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:news_app/features/auth/presentation/view_models/signup_cubit/signup_cubit.dart';
import 'package:news_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:news_app/features/auth/presentation/views/widgets/my_text_field.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
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
              SizedBox(
                height: AppSize.size10,
              ),
              const Text(
                "Hello!",
                style: TextStyle(
                    color: Color(0xff1877F2),
                    fontWeight: FontWeight.bold,
                    fontSize: 46),
              ),
              SizedBox(
                height: AppSize.size15,
              ),
              const Text(
                "Signup to get started",
                style: TextStyle(fontSize: 20, color: Color(0xff4E4B66)),
              ),
              SizedBox(
                height: AppSize.size50,
              ),
              const Text(
                "Username",
                style: TextStyle(color: Color(0xff4E4B66), fontSize: 17),
              ),
              SizedBox(
                height: AppSize.size10,
              ),
              MyTextField(
                hintText: "Username",
                controller: usernameController,
                obsecure: false,
                validator: (value) {
                  return validateUsername(value);
                },
              ),
              SizedBox(
                height: AppSize.size20,
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
                textInputType: TextInputType.emailAddress,
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
                height: AppSize.size20,
              ),
              BlocConsumer<SignupCubit, SignupState>(
                listener: (context, state) {
                  if (state is SignupError) {
                    customSnackBar(context, state.errorMessage);
                  }
                },
                builder: (context, state) {
                  return state is SignupLoading
                      ? const Center(child: CircularProgressIndicator())
                      : SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            text: "Sign up",
                            onPressed: () {
                              // LoginCubit.get(context).signIn(
                              //     email: emailController.text.trim(),
                              //     password: passwordController.text.trim());
                              if (_formKey.currentState!.validate()) {
                                SignupCubit.get(context).signUp(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                    username: usernameController.text.trim(),
                                    context: context);
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
                      text: "have an account already? ",
                      style: const TextStyle(
                          color: Color(0xff667080), fontSize: 14),
                      children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                GoRouter.of(context)
                                    .pushReplacement(AppRouter.kLoginView);
                              },
                            text: "Login",
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
