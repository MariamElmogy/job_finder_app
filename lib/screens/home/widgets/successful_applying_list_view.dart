import 'package:flutter/material.dart';
import 'package:job_finder_app/models/jobs_model.dart';
import 'package:job_finder_app/screens/home/widgets/recent_job.dart';
import 'package:job_finder_app/screens/home/widgets/successful_applying_item.dart';

import '../../../models/apply_job_model.dart';
import '../../job_details/views/job_details_view.dart';

class SuccessfulApplyingListView extends StatelessWidget {
  const SuccessfulApplyingListView({super.key, required this.jobs});
  final List<ApplyJobsModel> jobs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .26,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true, // btkhle l listview kolohm y build mara wa7da
          itemCount: jobs.length,
          itemBuilder: (context, index) {
            return  SuccessfulApplyingItem(job: jobs[index],);
          }),
    );
  }
}
