import 'package:flutter/material.dart';
import 'package:job_finder_app/utils/app_images.dart';

import '../../../utils/app_colors.dart';
import 'custom_search_job.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: IconButton(
          icon: Image.asset(AppImages.kSearch),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const CustomSearchJob();
              },
            ));
          },
        ),
        hintText: 'Search....',
        hintStyle: const TextStyle(
          fontSize: 14,
          color: AppColors.kRegisterHints,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Color(0xffD1D5DB),
          ),
        ),
      ),
    );
  }
}
