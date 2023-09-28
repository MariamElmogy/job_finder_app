import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/profile/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.arrow_back)),
              floating: true,
              pinned: false, // Make the app bar pinned when scrolling
              elevation: 0,
              iconTheme: const IconThemeData(
                color: Colors.black,
              ),
              backgroundColor: const Color(0xffD6E4FF),
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.exit_to_app),
                ),
              ],
            ),
            const SliverToBoxAdapter(
              child: ProfileViewBody(),
            ),
          ],
        ),
      ),
    );
  }
}
