import 'package:flutter/material.dart';
import 'package:job_finder_app/models/jobs_model.dart';
import 'package:job_finder_app/screens/home/views/home_view.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';

class CustomSearchBarView extends StatefulWidget {
  const CustomSearchBarView({super.key});

  @override
  State<CustomSearchBarView> createState() => _CustomSearchBarViewState();
}

class _CustomSearchBarViewState extends State<CustomSearchBarView> {
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
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
              ),
              _displayContainer
                  ? display_list.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    child: Image.asset(AppImages.kFilter),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : Center(
                          child: Column(
                            children: [
                              Image.asset(AppImages.kSearchIlustration),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Search not found',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: AppFonts.kRegisterHeadlineFont,
                                  color: Color(0xff111827),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  'Try searching with different keywords so\n we can show you',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff6B7280),
                                    fontFamily: AppFonts.kRegisterHintFont,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        )
                  : Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xffF4F4F5),
                            border: Border.all(color: const Color(0xffE5E7EB)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'Recent searches',
                              style: TextStyle(
                                color: Color(0xff6B7280),
                                fontFamily: AppFonts.kLoginHeadlineFont,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: display_list.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                right: 20.0,
                                left: 20.0,
                                bottom: 8.0,
                              ),
                              child: Row(
                                children: [
                                  ColorFiltered(
                                    colorFilter: const ColorFilter.mode(
                                      Colors.black,
                                      BlendMode.modulate,
                                    ),
                                    child: Image.asset(AppImages.kClock),
                                  ),
                                  const SizedBox(width: 15),
                                  Text(
                                    display_list[index].comp_name.toString(),
                                    style: const TextStyle(
                                      color: Color(0xff111827),
                                      fontSize: 14,
                                      fontFamily:
                                          AppFonts.kLoginSubHeadlineFont,
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        display_list.removeAt(index);
                                      });
                                    },
                                    child: Image.asset(
                                      AppImages.kCloseCircle,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xffF4F4F5),
                            border: Border.all(color: const Color(0xffE5E7EB)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'Recent searches',
                              style: TextStyle(
                                color: Color(0xff6B7280),
                                fontFamily: AppFonts.kLoginHeadlineFont,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
