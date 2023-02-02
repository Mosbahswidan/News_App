import 'package:news_app/core/utils/export.dart';
import 'package:news_app/features/auth/data/models/user_models.dart';
import 'package:news_app/features/edit_profile/presentation/view_model/edit_profile_state.dart';
import 'package:news_app/features/edit_profile/presentation/views/widget/edite_profile_body.dart';

class EditProfileView extends StatelessWidget {
  final UserModel? userModel;

  const EditProfileView({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        EditProfileCubit cubit = EditProfileCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                //color: Colors.black,
              ),
            ),
            centerTitle: true,
            title: const Text(
              'Edit Profile',
              //style: TextStyle(color: Colors.black),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  cubit
                      .updateUserData(
                    bio: cubit.bioController.text,
                    email: cubit.emailController.text,
                    name: cubit.fullNameController.text,
                    webSite: cubit.webSiteController.text,
                    phone: cubit.phoneController.text,
                    username: userModel!.username,
                    model: userModel!,
                  )
                      .then((value) {
                    Navigator.pop(context);
                  });
                },
                icon: const Icon(
                  Icons.check,
                  //color: Colors.black,
                ),
              ),
            ],
          ),
          body: EditProfileBody(model: userModel ?? UserModel()),
        );
      },
    );
  }
}
