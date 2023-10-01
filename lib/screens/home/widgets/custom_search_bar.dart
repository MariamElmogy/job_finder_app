import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:job_finder_app/models/jobs_model.dart';
import 'package:job_finder_app/screens/home/views/home_view.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  static List<JobsModel> jobs = [
    JobsModel(
      comp_name: 'Junior UI Designer',
    ),
    JobsModel(
      comp_name: 'Junior UX Designer',
    ),
    JobsModel(
      comp_name: 'Product Designer',
    ),
    JobsModel(
      comp_name: 'Project Manager',
    ),
    JobsModel(
      comp_name: 'UI/UX Designer',
    ),
    JobsModel(
      comp_name: 'Front-Erd Developer',
    ),
  ];

  bool _displayContainer = false;

  List<JobsModel> display_list = List.from(jobs);
  void updateList(String value) {
    setState(() {
      display_list = jobs
          .where((element) =>
              element.comp_name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
      _displayContainer = value.isNotEmpty;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 16.0,
            left: 8.0,
            top: 20.0,
            bottom: 20.0,
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return HomeView();
                    },
                  ));
                },
              ),
              Expanded(
                child: TextField(
                  onChanged: (value) => updateList(value),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical:
                            10), // adjust the vertical padding to reduce the height

                    prefixIcon: Image.asset(AppImages.kSearch),

                    hintText: 'Type something...',
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
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
