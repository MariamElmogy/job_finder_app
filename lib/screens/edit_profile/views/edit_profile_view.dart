import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import 'package:job_finder_app/utils/app_images.dart';
import '../widgets/edit_profile_form.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Center(
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(AppImages.kProfileUser),
                        backgroundColor: Colors.grey,
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.black.withOpacity(0.3),
                      ),
                      Positioned(
                        bottom: 1,
                        right: 1,
                        left: 1,
                        top: 1,
                        child: GestureDetector(
                          child: Image.asset(AppImages.kCamera),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    'Change Photo',
                    style: TextStyle(
                      color: Color(0xff3366FF),
                      fontFamily: AppFonts.kLoginHeadlineFont,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const EditProfileForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
