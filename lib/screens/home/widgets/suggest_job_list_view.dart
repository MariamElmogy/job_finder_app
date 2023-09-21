import 'package:flutter/cupertino.dart';
import 'package:job_finder_app/models/jobs_model.dart';
import 'package:job_finder_app/screens/home/widgets/recent_job.dart';
import 'package:job_finder_app/screens/home/widgets/suggest_job.dart';

import '../../../models/suggest_job_model.dart';

class SuggestJobListView extends StatelessWidget {
  const SuggestJobListView(
      {super.key,
      required this.jobsModel,
});

  final List<SuggestJobsModel> jobsModel;
 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      itemCount: jobsModel.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            var currentJob = jobsModel[index];
            //
          },
          // child: SuggestJob(
          //   job: jobsModel[index],
          // ),
        );
      },
    );
  }
}
