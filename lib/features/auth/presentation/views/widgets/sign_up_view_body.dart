import 'package:flutter/gestures.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/core/utils/export.dart';
import 'package:news_app/core/widgets/custom_snack_bar.dart';
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
                left: AppSize.size20,
                right: AppSize.size20,
                top: AppSize.size40,
              ),
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
                      fontSize: 46,
                    ),
                  ),
                  SizedBox(
                    height: AppSize.size15,
                  ),
                  const Text(
                    "Signup to get started",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff4E4B66),
                    ),
                  ),
                  SizedBox(
                    height: AppSize.size40,
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
                    height: 16,
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
                                  password: cubit.passwordController.text.trim(),
                                  username: cubit.usernameController.text.trim(),
                                  fullName: cubit.fullNameController.text.trim(),
                                  phone: cubit.phoneController.text.trim(),
                                  context: context,
                                );
                              }
                            },
                          ),
                        ),
                  SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "have an account already? ",
                        style: const TextStyle(
                          color: Color(0xff667080),
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
                              },
                            text: " Login",
                            style: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
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
