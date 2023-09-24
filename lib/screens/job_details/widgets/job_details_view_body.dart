import 'package:flutter/material.dart';
import 'package:job_finder_app/models/jobs_model.dart';
import '../widgets/company_detail.dart';
import '../widgets/job_description.dart';
import '../widgets/job_detail.dart';
import '../widgets/job_information.dart';
import '../widgets/people_applied.dart';

class JobDetailsViewBody extends StatefulWidget {
  const JobDetailsViewBody({super.key, required this.job});
  final JobsModel job;

  @override
  State<JobDetailsViewBody> createState() => _JobDetailsViewBodyState();
}

class _JobDetailsViewBodyState extends State<JobDetailsViewBody> {
  List<String> labels = ['Desicription', 'Company', 'People'];

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: JobInformation(job: widget.job),
        ),
        SliverToBoxAdapter(
          child: JobDetail(
            counter: counter,
            labels: labels,
            onToggle: (index) {
              setState(
                () {
                  counter = index!;
                },
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: counter == 0
              ? JobDescription(
                  job: widget.job,
                )
              : counter == 1
                  ? CompanyDetail(
                      job: widget.job,
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PeopleApplied(jobsModel: widget.job),
                    ),
        ),
      ],
    );
  }
}
