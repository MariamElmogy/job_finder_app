import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder_app/screens/home/views/main_wrapper_controller.dart';
import 'package:job_finder_app/screens/profile/views/profile_view.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/app_images.dart';
import '../../applied/views/applied_view.dart';
import '../../message/views/message_view.dart';
import '../../saved/views/saved_view.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  static const String id = 'home_view';
  final MainWrapperController controller = Get.put(MainWrapperController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: controller.pageController,
          children: const [
            HomeViewBody(),
            MessageView(),
            AppliedView(),
            SavedView(),
            ProfileView(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _bottomAppBarItem(context,
                    img: AppImages.kHome, label: 'Home', page: 0),
                _bottomAppBarItem(context,
                    img: AppImages.kMessage, label: 'Messages', page: 1),
                _bottomAppBarItem(context,
                    img: AppImages.kApply, label: 'Applied', page: 2),
                _bottomAppBarItem(context,
                    img: AppImages.kArchive, label: 'Saved', page: 3),
                _bottomAppBarItem(context,
                    img: AppImages.kProfile, label: 'Profile', page: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomAppBarItem(BuildContext context,
      {required img, required page, required label}) {
    return ZoomTapAnimation(
      onTap: () => controller.goToTab(page),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            img,
            color: controller.currentPage.value == page
                ? const Color(0xff3366FF)
                : const Color(0xff9CA3AF),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: controller.currentPage.value == page
                  ? const Color(0xff3366FF)
                  : const Color(0xff9CA3AF),
            ),
          ),
        ],
      ),
    );
  }
}
