import 'package:flutter/cupertino.dart';
import 'package:job_finder_app/models/jobs_model.dart';
import 'package:job_finder_app/screens/home/widgets/recent_job.dart';

class RecentJobListView extends StatelessWidget {
  const RecentJobListView({
    super.key,
    required this.jobsModel,
  });

  final List<JobsModel> jobsModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: jobsModel.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            var currentJob = jobsModel[index];
            //
          },
          child: RecentJob(
            job: jobsModel[index],
          ),
        );
      },
    );
  }
}
