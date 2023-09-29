import 'package:flutter/material.dart';
import 'package:job_finder_app/models/favorites_jobs_model.dart';
import 'package:job_finder_app/models/jobs_model.dart';
import 'package:job_finder_app/screens/home/widgets/recent_job.dart';
import 'package:job_finder_app/screens/saved/widgets/saved_jobs.dart';

import '../../job_details/views/job_details_view.dart';

class SavedListView extends StatelessWidget {
  const SavedListView({
    super.key,
    required this.jobsModel,
  });

  final List<FavoritesJobsModel> jobsModel;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: jobsModel.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // var currentJob = jobsModel[index];
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return JobDetailsView(
            //         job: currentJob,
            //       );
            //     },
            //   ),
            // );
          },
          child: SavedJobs(
            job: jobsModel[index],
          ),
        );
      },
    );
  }
}
