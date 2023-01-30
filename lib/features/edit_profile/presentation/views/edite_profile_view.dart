import 'package:flutter/material.dart';
import 'package:news_app/features/edit_profile/presentation/views/widget/edite_profile_body.dart';
import 'package:news_app/features/settings/presentation/views/widget/settings_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.check,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: EditProfileBody(),
    );
  }
}
