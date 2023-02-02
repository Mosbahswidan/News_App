import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/widgets/custom_snack_bar.dart';
import 'package:news_app/features/auth/presentation/view_models/signup_cubit/signup_cubit.dart';
import 'package:news_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:news_app/features/auth/presentation/views/widgets/sign_up_text_field.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupError) {
          customSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        SignupCubit cubit = SignupCubit.get(context);
        return SafeArea(
          child: Form(
            key: cubit.formKey,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                top: 20.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Hello!",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: const Color(0xff1877F2)),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "Signup to get started",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SignUpTextField(
                    fieldTitle: 'User Name',
                    controller: cubit.usernameController,
                    textInputType: TextInputType.name,
                    hintText: 'Enter user name',
                  ),
                  SignUpTextField(
                    fieldTitle: 'Full Name',
                    controller: cubit.fullNameController,
                    textInputType: TextInputType.name,
                    hintText: 'Enter full name',
                  ),
                  SignUpTextField(
                    fieldTitle: 'Emial Address',
                    controller: cubit.emailController,
                    textInputType: TextInputType.emailAddress,
                    hintText: 'Enter emial address',
                  ),
                  SignUpTextField(
                    fieldTitle: 'Password',
                    controller: cubit.passwordController,
                    textInputType: TextInputType.visiblePassword,
                    hintText: 'Enter password',
                  ),
                  SignUpTextField(
                    fieldTitle: 'phone',
                    controller: cubit.phoneController,
                    textInputType: TextInputType.phone,
                    hintText: 'Enter phone',
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  state is SignupLoading
                      ? const Center(child: CircularProgressIndicator())
                      : SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            text: "Sign up",
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.signUp(
                                  email: cubit.emailController.text.trim(),
                                  password:
                                      cubit.passwordController.text.trim(),
                                  username:
                                      cubit.usernameController.text.trim(),
                                  fullName:
                                      cubit.fullNameController.text.trim(),
                                  phone: cubit.phoneController.text.trim(),
                                  context: context,
                                );
                              }
                            },
                          ),
                        ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "have an account already? ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 14.sp),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                GoRouter.of(context)
                                    .pushReplacement(AppRouter.kLoginView);
                              },
                            text: " Login",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: Colors.blue,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
