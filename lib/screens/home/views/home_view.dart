import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/work_suggestions/views/work_suggestions_view.dart';
import 'package:job_finder_app/utils/app_colors.dart';

import '../../../utils/app_images.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String id = 'home_view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: HomeViewBody(),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  bool isSelected = false;

  void _onItemTapped(int index) {
    setState(() {
      isSelected = true;
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.kBorderFocusColor,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
      showSelectedLabels: isSelected,
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: SelectedBottomBar(
            isSelected: isSelected,
            image: AppImages.kHome,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Messages',
          icon: SelectedBottomBar(
            isSelected: isSelected,
            image: AppImages.kMessage,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Applied',
          icon: SelectedBottomBar(
            isSelected: isSelected,
            image: AppImages.kApply,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Saved',
          icon: SelectedBottomBar(
            isSelected: isSelected,
            image: AppImages.kArchive,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: SelectedBottomBar(
            isSelected: isSelected,
            image: AppImages.kProfile,
          ),
        ),
      ],
    );
  }
}

class SelectedBottomBar extends StatelessWidget {
  const SelectedBottomBar({
    super.key,
    required this.isSelected,
    required this.image,
  });

  final bool isSelected;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        isSelected ? AppColors.kBorderFocusColor : Colors.grey,
        BlendMode.modulate,
      ),
      child: Image.asset(image),
    );
  }
}
