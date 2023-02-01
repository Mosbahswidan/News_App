import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/core/utils/export.dart';
import 'package:news_app/features/auth/data/models/user_models.dart';
import 'package:news_app/features/auth/presentation/views/widgets/sign_up_text_field.dart';
import 'package:news_app/features/edit_profile/presentation/view_model/edit_profile_state.dart';

class EditProfileBody extends StatelessWidget {
  final UserModel? model;

  const EditProfileBody({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        EditProfileCubit cubit = EditProfileCubit.get(context);
        cubit.emailController.text = model!.email!;
        cubit.bioController.text = model!.bio!;
        cubit.fullNameController.text = model!.fullName!;
        cubit.phoneController.text = model!.phone!;
        cubit.webSiteController.text = model!.webSite!;
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.size20,
              vertical: AppSize.size20,
            ),
            child: model == null
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      if (state is EditProfileLoading) LinearProgressIndicator(),
                      Center(
                        child: SizedBox(
                          height: 125,
                          width: 120,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.transparent,
                                backgroundImage: NetworkImage(model!.image!),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 4.0,
                                  bottom: 2.0,
                                ),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: const Align(
                                    alignment: Alignment.bottomRight,
                                    child: CircleAvatar(
                                      radius: 18,
                                      child: Center(
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 45,
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
                        fieldTitle: 'phone',
                        controller: cubit.phoneController,
                        textInputType: TextInputType.phone,
                        hintText: 'Enter phone',
                      ),
                      SignUpTextField(
                        fieldTitle: 'Bio',
                        controller: cubit.bioController,
                        textInputType: TextInputType.text,
                        hintText: 'Enter bio',
                      ),
                      SignUpTextField(
                        fieldTitle: 'WebSite',
                        controller: cubit.webSiteController,
                        textInputType: TextInputType.url,
                        hintText: 'Enter web site',
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
