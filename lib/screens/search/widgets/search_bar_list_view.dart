import 'package:flutter/material.dart';
import 'package:job_finder_app/models/jobs_model.dart';
import 'package:job_finder_app/screens/search/widgets/seach_bar_item.dart';

class SearchBarListView extends StatefulWidget {
  const SearchBarListView({
    super.key,
    required this.jobsModel,
    // required this.searchController,
  });

  final List<JobsModel> jobsModel;
  // final TextEditingController searchController;

  @override
  State<SearchBarListView> createState() => _SearchBarListViewState();
}

class _SearchBarListViewState extends State<SearchBarListView> {
  // late final filteredJobs;

  // @override
  // void initState() {
  //   filteredJobs = widget.jobsModel
  //       .where((job) => job.name!
  //           .toLowerCase()
  //           .contains(widget.searchController.text.toLowerCase()))
  //       .toList();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.jobsModel.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: SearchBarItem(job: widget.jobsModel[index]),
        );
      },
    );
  }
}
