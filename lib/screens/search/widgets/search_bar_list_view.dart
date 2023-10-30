import 'package:flutter/material.dart';
import 'package:job_finder_app/models/jobs_model.dart';
import 'package:job_finder_app/screens/search/widgets/seach_bar_item.dart';

import '../../job_details/views/job_details_view.dart';

class SearchBarListView extends StatefulWidget {
  const SearchBarListView({
    super.key,
    required this.jobsModel,
  });

  final List<JobsModel> jobsModel;

  @override
  State<SearchBarListView> createState() => _SearchBarListViewState();
}

class _SearchBarListViewState extends State<SearchBarListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.jobsModel.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            var currentJob = widget.jobsModel[index];

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return JobDetailsView(
                    job: currentJob,
                  );
                },
              ),
            );
          },
          child: SearchBarItem(job: widget.jobsModel[index]),
        );
      },
    );
  }
}
