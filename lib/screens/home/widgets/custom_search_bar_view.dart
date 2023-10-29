import 'package:flutter/material.dart';
import 'package:job_finder_app/models/jobs_model.dart';
import 'package:job_finder_app/screens/home/views/home_view.dart';
import 'package:job_finder_app/utils/app_fonts.dart';
import '../../../services/job_api_service.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../search/widgets/seach_bar_item.dart';

class CustomSearchBarView extends StatefulWidget {
  const CustomSearchBarView({super.key});

  @override
  State<CustomSearchBarView> createState() => _CustomSearchBarViewState();
}

class _CustomSearchBarViewState extends State<CustomSearchBarView> {
  bool _displayContainer = false;
  List<JobsModel> displayList = [];
  List<JobsModel> jobsModel = [];
  @override
  void initState() {
    super.initState();
    _loadJobsData();
  }

  Future<void> _loadJobsData() async {
    try {
      // Fetch jobs data from your API service
      List<JobsModel> apiData = await JobApiService.fetchAllJobsData();
      setState(() {
        displayList = apiData;
      });
    } catch (error) {
      // Handle error, e.g., show an error message
      print('Error fetching data: $error');
    }
  }

  void updateList(String value) {
    setState(() {
      displayList = displayList
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
              !_displayContainer
                  ? Column(
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
                        const SizedBox(height: 10),
                        const SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: displayList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: SearchBarItem(job: displayList[index]),
                            );
                          },
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                  // child: Image.asset(AppImages.kFilter),
                                  ),
                            ],
                          ),
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
